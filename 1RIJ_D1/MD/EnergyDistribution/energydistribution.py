#!/usr/bin/python
#-*- coding: utf-8 -*-

#Imported Libraries
import sys
import os
import datetime
import re
import traceback
import time
import csv
import labio.configWrapper
import labio.argParseWrapper
import labio.logWrapper
import labio.dbWrapper
import math


def convertTemperatureToKT(cfg,pTemperature):
	oper1 = float(cfg.temp25_Kmol)
	oper2 = float(cfg.temp25_Kelvin)
	return (oper1*pTemperature)/oper2

def parseTemperatureFile(cfg,log,fileName,dbEnergy):
	f = open(os.path.join(cfg.fileInputPath,fileName), 'r')

	for line in f:
		if (line[0] == "#"):
			print "linha é: " + line
			break
		#print line[0]
		convertedTemp = convertTemperatureToKT(cfg,float(line))
		dbEnergy.executeCommand(cfg.sqlInsertTemperatureTable % (line, convertedTemp))

	dbEnergy.commit()

def parseMDOutFile(cfg,log,inputFile,fileName,dbEnergy):
	startRec = False
	intDryRun = 0
	datatoInsert = []
	datatoInsert.append(fileName)
	for line in inputFile:
		arrLine = filter(None,line.replace('\n','').split(' '))

		if not startRec:
			if 'NSTEP' in line:
				startRec = True
				for item in cfg.fields:
					if item in arrLine:
						if arrLine.index(item) >= 0:
							indexValue = arrLine.index(item) + 2
							datatoInsert.append(arrLine[indexValue])
		else:
			if '------' in line:
				startRec = False
				intDryRun += 1
				dbEnergy.executeCommand(cfg.sqlInsertEnergyTable % tuple(datatoInsert))
				datatoInsert = []
				datatoInsert.append(fileName)
			else:
				for item in cfg.fields:
					if item in arrLine:
						if arrLine.index(item) >= 0:
							indexValue = arrLine.index(item) + 2
							datatoInsert.append(arrLine[indexValue])

		if cfg.dryrun:
			if intDryRun > cfg.dryrunLimit:
				break

	dbEnergy.commit()

def processFiles(cfg,log,dbase):
	import glob
	
	for root, dirs, files in os.walk(cfg.fileInputPath, topdown=False):
        	for name in files:
            		if cfg.temperatureFile in name:
               			parseTemperatureFile(cfg,log,name,dbase)
            
	for name in glob.glob(os.path.join(cfg.fileInputPath,cfg.filestoSearch)):
            	try:
#                    if name in glob.glob(cfg.filestoSearch):
                    	log.info('Processing file: %s' % name)
                    	f = open(name, 'r')

#                        if name in glob.glob(cfg.filestoSearch):
                    	parseMDOutFile(cfg,log,f,name,dbase)

            	except:
            		log.info('Error processing file %s' % name)
            		log.error(traceback.format_exc())


def calculateEnergies(cfg,log,dbase,pTemperature):
	try:
		log.info('Calculating energies: e^(-EpTot/Kb*Temp) ...')
		sqlEnergies = dbase.getData(cfg.sqlSelectbyTemperature % pTemperature)

		for item in sqlEnergies:
			oper1 = item[1] * (-1)
			oper2 = oper1 / item[2]
			oper3 = math.e**oper2
			dbase.executeCommand(cfg.sqlUpdateEnergyTable % (item[2],oper2,oper3,item[0])) 

		dbase.commit()
	except:
		log.error(traceback.format_exc())

	try:	
		log.info('Summing up energies...')
		sqlPartition_Function = dbase.getData(cfg.sqlSelectPartition_Function % pTemperature)
	except:
		log.error(traceback.format_exc())

	try:
		log.info('Calculating pE and ln(pE) - ...')
		sqlEnergiespE = dbase.getData(cfg.sqlSelectpEbyTemperature % pTemperature)

		for part_func in sqlPartition_Function:
			for item in sqlEnergiespE:
				pE = item[1] / part_func[1]
				ln_pE = math.log(pE)
				dbase.executeCommand(cfg.sqlUpdateEnergyTablepE % (part_func[1],pE,ln_pE,item[0])) 

		dbase.commit()
	except:
		log.error(traceback.format_exc())

def generateXVGFile(cfg,log,dbase,pTemperature, prowCount, pLegendOffset):
	try:
		log.info('Generating file for temperature of  %s' % pTemperature )
		sqlList = dbase.getData(cfg.sqlPEbyTemperature % pTemperature)
		f = open(os.path.join(cfg.fileOutputPath,(cfg.fileToSave % pTemperature)), 'wb')
		f.write((cfg.headerToSave % (pLegendOffset,prowCount,pTemperature)).replace('^','\n') + '\n')
		for item in sqlList:
			f.write((cfg.lineToSave + '\n') % (item[0],item[1]))

		f.close()
	except:
		log.error(traceback.format_exc())

def generateDistFile(cfg,log,dbase,pTemperature):
	try:
		log.info('Generating distribution file for temperature of  %s' % pTemperature )

		strCommand = (cfg.g_Analyze % (os.path.join(cfg.fileOutputPath,(cfg.fileToSave % pTemperature)),os.path.join(cfg.fileOutputPath,(cfg.fileToSaveDist % pTemperature))))
		if cfg.windowsRun:
			log.info(strCommand)
		else:
			os.system(strCommand)
	except:
		log.error(traceback.format_exc())

def generateGnuPlotDistFile(cfg,log,dbase):
	if cfg.actions["Temp"] == 0:
		sqlList = dbase.getData(cfg.sqlSelectTemperature)
		strCommand = " "
		fgnuPlot = open(os.path.join(cfg.fileOutputPath,cfg.gnuplotDistFile),"w")

		header = os.popen(cfg.gnuplotHeader).read()

		fgnuPlot.write('#!' + str(header))

		for item in cfg.gnuplot_commands_dist:
			fgnuPlot.write(item + '\n')			

		it = 1
		
		#tamanho = sqlList.rowcount
		tamanho = 14
		#print tamanho
		for item in sqlList:
			#print item
			if it == 1:
				strCommand += '\n\n' + (cfg.gnuplot_line1) % ((cfg.fileToSaveDist % item[0]),item[0])
				it += 1
			else:
				if it < tamanho:
					strCommand += '\n' + (cfg.gnuplot_line2) % ((cfg.fileToSaveDist % item[0]),item[0])
					it += 1
				else:
					strCommand += '\n' + (cfg.gnuplot_line3) % ((cfg.fileToSaveDist % item[0]),item[0])

		fgnuPlot.write(strCommand)
		fgnuPlot.close()

def generateGnuPlotEnergyFile(cfg,log,dbase):
	if cfg.actions["Temp"] == 0:
		sqlList = dbase.getData(cfg.sqlSelectTemperature)
		strCommand = " "
		fgnuPlot = open(os.path.join(cfg.fileOutputPath,cfg.gnuplotEnergyFile),"w")

		header = os.popen(cfg.gnuplotHeader).read()
		fgnuPlot.write('#!' + str(header))

		for item in cfg.gnuplot_commands_en:
			fgnuPlot.write(item + '\n')			
		
		it =1
		
		#tamanho = sqlList.rowcount
		tamanho = 14
		#print tamanho
		for item in sqlList:
			#print item
			if it == 1:
				strCommand += '\n\n' + (cfg.gnuplot_line1) % ((cfg.fileToSave % item[0]),item[0])
				it += 1
			else:
				if it < tamanho:
					strCommand += '\n' + (cfg.gnuplot_line2) % ((cfg.fileToSave % item[0]),item[0])
					it += 1
				else:
					strCommand += '\n' + (cfg.gnuplot_line3) % ((cfg.fileToSave % item[0]),item[0])
		fgnuPlot.write(strCommand)
		fgnuPlot.close()


def main(cfgFile):
	returnValue = 0

	print(datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S'))
	print("Loading Configuration...")

	fileConfig = labio.configWrapper.load_configuration(cfgFile)

	if fileConfig.isLoaded:
		logging = labio.logWrapper.return_logging(fileConfig.log)
		
		logging.info('Starting process...')        

		#Your code here	
		db = labio.dbWrapper.dbSQLiteWrapper(fileConfig.database)
		if db.isDatabaseOpen():
			logging.info('Database opened.')
			if db.isDatabaseNew():
				db.executeCommand(fileConfig.sqlEnergyTable)
				db.executeCommand(fileConfig.sqlTemperatureTable)
	

			if fileConfig.actions["Load"]:
				logging.info('Cleaning Database...')
				db.executeCommand(fileConfig.sqlTruncateEnergyTable)
				db.executeCommand(fileConfig.sqlTruncateTemperatureTable)
				logging.info('Loading Files...')
				processFiles(fileConfig,logging,db)	

			if fileConfig.actions["Calculate"]:
				if fileConfig.actions["Temp"] == 0:
					sqlList = db.getData(fileConfig.sqlSelectTemperature)
					for item in sqlList:
						calculateEnergies(fileConfig,logging,db,item[0])
				else:
					calculateEnergies(fileConfig,logging,db,fileConfig.actions["Temp"])

			if fileConfig.actions["Write"]:
				rowOffset = fileConfig.legendRowStart
				rowCount = fileConfig.legendRow
				if fileConfig.actions["Temp"] == 0:
					logging.info('About to generate XVG files...')
					sqlList = db.getData(fileConfig.sqlSelectTemperature)
					for item in sqlList:
						generateXVGFile(fileConfig,logging,db,item[0],rowCount,rowOffset)
						rowOffset += fileConfig.legendRowOffset
						rowCount += 1
				else:
					generateXVGFile(fileConfig,logging,db,fileConfig.actions["Temp"],rowCount,rowOffset)
		
			if fileConfig.actions["Dist"]:
				rowOffset = fileConfig.legendRowStart
				rowCount = fileConfig.legendRow
				if fileConfig.actions["Temp"] == 0:
					sqlList = db.getData(fileConfig.sqlSelectTemperature)
					for item in sqlList:
						generateDistFile(fileConfig,logging,db,item[0])
						rowOffset += fileConfig.legendRowOffset
						rowCount += 1
				else:
					generateDistFile(fileConfig,logging,db,fileConfig.actions["Temp"])

			if fileConfig.actions["Cat"]:
				if fileConfig.actions["Temp"] == 0:
					sqlList = db.getData(fileConfig.sqlSelectTemperature)
					strCommand = " "
					for item in sqlList:
						strCommand += os.path.join(fileConfig.fileOutputPath,(fileConfig.fileToSaveDist % item[0])) + " "

					if fileConfig.windowsRun:
						logging.info(fileConfig.catCommand % (strCommand,fileConfig.fileOutputPath))
					else:
						os.system(fileConfig.catCommand % (strCommand,fileConfig.fileOutputPath))

			if fileConfig.actions["GnuPlot"]:
				if fileConfig.actions["GnuPlotType"]["Energy"]:
					generateGnuPlotEnergyFile(fileConfig,logging,db)
				if fileConfig.actions["GnuPlotType"]["Distribution"]:
					generateGnuPlotDistFile(fileConfig,logging,db)

		logging.info('Ending process...')        
	else:
		print("Configuration not loaded. Please create the config file.")

	print(datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S'))
	return returnValue


if __name__ == '__main__':
	exitCode = 0


	#I added this to address a problem with one of my .mdouts, in a set of simulations
	# the default value for problem_with_mdout is 0. With this flag on the program will remove from the remd_002.mdout files the lines containing TIME(PS) =  value.500
	
	problem_with_mdout = sys.argv[1]
	#print problem_with_mdout
	#problem_with_mdout = int(problem_with_mdout)
	if problem_with_mdout == "1":
		print "002 mdout with problem... processing"
		os.system("pwd")
		os.chdir("..")
		os.system("pwd")
		os.system ("sed -i.bak '/.500  TEMP(K)/d' ./remd_002*.mdout.*")
		os.system ("mkdir backup_mdouts")
		os.system ("mv *.bak* backup_mdouts/")
		os.chdir("EnergyDistribution")
		os.system("pwd")

	try:
		if len(sys.argv) < 3:
	 		cfgName = "energydistribution.config"
	 	else:
	 		cfgName = sys.argv[1]

	 	exitCode = main(cfgName)
	except:
	 	print traceback.format_exc()
	 	exitCode = 1

	sys.exit(exitCode)

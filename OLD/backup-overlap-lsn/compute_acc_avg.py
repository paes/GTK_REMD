#!/usr/bin/python
import sys
import numpy as np

text = ''




in_file = "ACC_final_123.dat"

with open(in_file, 'r') as f:
	col=[row.split("\t") for row in f]

	print col
	for linha in col:
		print "nova temperatura"
		#new_col= (float(value))
		#print new_col
		#print linha
		controle = 0
		avg001 = 0
		avg002 = 0
		avg003 = 0
		avg004 = 0
		avg005 = 0
		avg006 = 0
		init_temp = ""
		fin_temp = ""
		print "linha => " + str(linha)
		for value in linha:
			controle = controle + 1
			#value = value + "0" 
			print "valor = " + value
			if float(value) < 1:
				print float(value)
				print controle
				if controle == 3 or controle == 11 or controle == 19 :
					print "somos do 001 :" + value
					avg001 = avg001 + float(value)
				if controle == 4 or controle == 12 or controle == 20 :
					print "somos do 002 :" + value
					avg002 = avg002 + float(value)
				if controle == 5 or controle == 13 or controle == 21 :
					print "somos do 003 :" + value
					avg003 = avg003 + float(value)
				if controle == 6 or controle == 14 or controle == 22 :
					print "somos do 004 :" + value
					avg004 = avg004 + float(value)
				if controle == 7 or controle == 15 or controle == 23 :
					print "somos do 005 :" + value
					avg005 = avg005 + float(value)
				if controle == 8 or controle == 16 or controle == 24 :
					print "somos do 006 :" + value
					avg006 = avg006 + float(value)
			else:
				if controle == 1 :
					init_temp = value
				if controle == 2:
					fin_temp = value



		line = init_temp +"-"+ fin_temp + " " + str( float(avg001 / 3))	+ " " + str( float(avg002 / 3)) + " " +  str( float(avg003 / 3)) + " "  +  str( float(avg004 / 3)) + " " +  str( float(avg005 / 3)) + " " +  str( float(avg006 / 3)) + "\n"
		text += line	

#words = in_file.split('.')
#words = words[0].split('/')
output = "ACC_123_avg_results.dat"



out = open(output, 'w')
out.write(text)
out.close()


#   "269.50" 1 , 

#   "285.22" 3 , 

#   "301.66" 5 , 

#   "318.76" 7 , 

#   "336.61" 9 , 

#   "355.26" 11 , 

#   "374.74" 13 , 

#   "395.07" 15 , 

#   "416.32" 17 , 

#   "438.50" 19 , 

#   "461.67" 21 , 

#   "485.87" 23 , 

#   "511.14" 25 , 

#   "537.54" 27 )

#!/usr/bin/python
import sys
import numpy as np

## THIS .py scans 14 .rmsd.dat (each replica) and returns a file with the Temperature(T) LowestValue(LV) LowerQuartile(Q1) MiddleQuartile(Q2) HigherQuartile(Q3) e HighestValue(HV)
## usage: python compute_AMM.py output input1 input2 input3 ... inputn
#in_file = open(sys.argv[1], "rw") ........ 


#IMPORTANTE, O CMD eh o 4 na numeracao das pastas,  ele continua o dados4.dat, e isso eh solucionado na hora de criar o grafico yerrorbars para os graficos com quartis, eu modifiquei antes, ou seja, o dados7 virou o 8, arrumando a ordem e assim acabando com a necessidade de tratar isso na hora de criar o grafico de candlebars
text = ''

x = 2
while (x < 16):
	in_file = sys.argv[x]
	method = in_file.split('-')	
	if method[0] == "rmsd" :
		with open(in_file, 'r') as f:
			next(f)
			#print "pulei"
			#print method[0]	
			col=[float(row.split("     ")[-1]) for row in f]
    	else: 
		with open(in_file, 'r') as f:
			#print "nao pulei, gdt" NAO ENTENDI PQ O RMSD TA ENTRANDO AQUI!
			#print method[0]	
			next(f)			
			col=[float(row.split("     ")[-1]) for row in f]		

	words = in_file.split('.')
#aqui eu tenho o col contendo todos os rmsds daquela temperatura
	#print col
	#print "teste"
	#LV = min(col) # LV WRONG?
	Q1 = np.percentile(col,25,axis=None, out=None, overwrite_input=False, interpolation='midpoint', keepdims=False) #Q1
	Q2 = np.percentile(col,50,axis=None, out=None, overwrite_input=False, interpolation='midpoint', keepdims=False) # Q2
	Q3 = np.percentile(col,75,axis=None, out=None, overwrite_input=False, interpolation='midpoint', keepdims=False) # Q3	
	LV = (Q1 - (1.5 * (Q3 - Q1)) )
	#HV = max(col) #HV WRONG?
	HV = (Q3 + (1.5 * (Q3 - Q1)) )
	line = words[3] + "." + words[4] + ', {}, {}, {}, {}, {},'.format(LV,Q1,Q2,Q3,HV) + '\n' #ultima virgula necessaria pq uso o paste dps em mais de um arquivo
	#print line	
	text += line	
	x = x + 1
#print text
out = open(sys.argv[1], 'w')
out.write(text)
out.close()

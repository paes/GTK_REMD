#!/usr/bin/python
import sys


## THIS .py scans 14 .rmsd.dat (each replica) and returns a file with the avg, min and max for each temperature.
## usage: python compute_AMM.py output input1 input2 input3 ... inputn
#in_file = open(sys.argv[1], "rw")
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
			col=[float(row.split("  ")[-1]) for row in f]
    	else: 
		with open(in_file, 'r') as f:
			#print "nao pulei, gdt"
			#print method[0]	
			col=[float(row.split("  ")[-1]) for row in f]	

	words = in_file.split('.')
	line = words[3] + "." + words[4] + ', {}, {}, {},'.format(sum(col)/float(len(col)),min(col),max(col)) + '\n'
	text += line	
	x = x + 1
#print text
out = open(sys.argv[1], 'w')
out.write(text)
out.close()


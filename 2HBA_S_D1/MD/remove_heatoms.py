#!/usr/bin/python
import sys


text = [] 
infile = sys.argv[1]


f = open(infile,"r")
lines = f.readlines()
f.close

f = open(infile,"w")
for line in lines:
	space = line.split(' ')
	if space[0] != "HETATM":
		text.append(line)
		#print line


f.write("".join(text))
f.close()

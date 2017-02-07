#!/usr/bin/python
import sys
import numpy as np

text = ''

in_file = sys.argv[1]
#exchanges = sys.argv[2]
exchanges = float(sys.argv[2])
exchanges = exchanges / 2
#print exchanges
with open(in_file, 'r') as f:
	col=[row.split("\t")[-1] for row in f]
	#print col
	for value in col:
		new_col= (float(value))
		new_col= new_col / exchanges
		#print new_col
		line = str(new_col)	+ "\n"
		text += line	

words = in_file.split('.')
words = words[0].split('/')
output = words[-1] + "_results.dat"


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


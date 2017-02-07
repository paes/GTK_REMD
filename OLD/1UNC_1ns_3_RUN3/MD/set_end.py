import os, sys

xyzText = []	
arquivo = "ended.dat"				
#print arquivo
xyzText = sys.argv[1] + "\n"
output = open(arquivo, "ab")
output.write(xyzText)
output.close			

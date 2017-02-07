import os, sys
energysRaw =  sys.argv[1] 
temperature = sys.argv[2]

#python compute_energies.py arquivo.temporary temperatura saida

text = []

text.append("@    title \"Amber Energies\"\n")
text.append("@    title \"Amber Energies\"\n")
text.append("@    xaxis  label \"Time (ps)\"\n")
text.append("@    yaxis  label \"(kJ/mol)\"\n")
text.append("@TYPE xy\n")
text.append("@ view 0.15, 0.15, 0.75, 0.85\n")
text.append("@ legend on\n")
text.append("@ legend box on\n")
text.append("@ legend loctype view\n")
text.append("@ legend 0.78, 0.8\n")
text.append("@ legend length 2\n")
text.append("@ s1 legend \""+ temperature +"K\"\n")

filein = open(sys.argv[1], "r")
counter = 0
for line in filein:
	line1 = line.split()
	text.append(str(counter)+'\t'+ line1[0]+"\n")
	counter = counter + 1
fileout = open(sys.argv[3], "w")
fileout.writelines(text)
fileout.close()
filein.close()		




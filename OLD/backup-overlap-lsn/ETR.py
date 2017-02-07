#this script is responsible for calculating the ETR - Energy Trapping Ratio.

import os, sys

xyzText = []
funnel_events = 0
summ_intervalos = 0
fruits = [' 1', ' 2', ' 3', ' 4',  ' 5', ' 6', ' 7', ' 8',  ' 9', '10', '11', '12',  '13', '14']
arr = []
arr_all = []

inputs =  sys.argv[1]

#echo "cat argv[0]*.log > input_eaf.newlog"
os.system("/bin/cat "+  inputs + "*.log > input_eaf.newlog")

for fruit in fruits:
	
	arr = []
	
	#for line in open("rem_001_small_001.log", "r"):
	for line in open("input_eaf.newlog", "r"):
		#print(line)
		line1 = line.split()
		replica = line[0:2]
		temp_old = line[36:42]
		temp_new= line[46:52]
		
		#print replica
		if replica == fruit:
			arr.append(temp_old)

	if len(arr) != 0:
		#print len(arr)
		arr_all.append(arr)					



print len(arr)
print len(arr_all)

trapping=[]

for A in range(0, len(arr_all)):	
	temp_antiga = 0
	temp_antiga2 = -1
	trapping_replica = 0
	successful_exch = 0
	ETR = 0
	for B in range(0, len(arr)):

		atual = arr_all[A][B]
		if atual != temp_antiga:
			successful_exch = successful_exch + 1
			print "a antiga eh diferente da nova -- Antiga: " + str(temp_antiga) + " nova: "  + str(atual) + " --  nro de successful exchanges: " + str(successful_exch)
				
			print "temp antiga2: " + str(temp_antiga2)
			print "temp antiga: " + str(temp_antiga)
			print "temp atual: " +   str(atual)
		

			
			if str(atual) == str(temp_antiga2):
				trapping_replica = trapping_replica + 1
				ETR = float (float(trapping_replica) / float(successful_exch))
				print "acho que temos um caso de trapping, onde estavamos em " + temp_antiga2 + ", passeamos e chegamos em " + atual + " contagem de trappings: " + str(trapping_replica)
				print "Exchange Trapping Ratio for Replica " + str(A + 1) + " untill now: " + str(ETR)
			
			temp_antiga2 = temp_antiga # aqui vou contabilizar
			temp_antiga = atual#isso pro prixmo passo
			
		else:
			print "nada de novo"			#nao mdo nada, pois a antiga2 permanece a antiga2 e a antiga sera usada na comparacao quando (se) modificar.
		print arr_all[A][B] + " " + str(A)	+ " " + str(B)	
		


	
		if B == len(arr) - 1:
			print "Finalizando uma das replicas!! ... "
			trapping.append(ETR)
			#aqui vou salvar o resultado!
		

	
print trapping

for value in trapping:
			line = str(value) + "\n"
			xyzText.append(line)
#print arr_all[0]
#print arr.legnth
out = sys.argv[1] + "_ETR.out"
output = open(out, "w")
output.writelines(xyzText)
output.close			

os.system("/usr/bin/paste rem_00*_ETR.out > ETR_total.out")




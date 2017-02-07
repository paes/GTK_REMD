import os, sys, time
	

fruits = ['001', '002', '003', '004',  '005', '006', '007', '008',  '009', '010', '011', '012',  '013', '014']

while (len(fruits) != 0):
	for line in open("ended.dat", "r"):
			#print line
			line1 = line.split()
			replica = line1[0]
			#print replica		
			if replica in fruits:
				fruits.remove(replica)
				print fruits
	time.sleep(5)		



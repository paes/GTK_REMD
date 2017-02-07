import os, sys, time
	


with open('temperatures.dat') as f:
    num = sum(1 for _ in f)


fruits = []
for x in range(1,num+1):
	value = "%03d"%x
	x = x+1
	fruits.append(value)


#print fruits
while (len(fruits) != 0):
	for line in open("ended.dat", "r"):
			#print line
			line1 = line.split()
			replica = line1[0]
			#print replica		
			if replica in fruits:
				fruits.remove(replica)
				#print fruits
	print fruits	
	time.sleep(5)		



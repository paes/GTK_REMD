#!/bin/bash -f
####This script is responsible of generating gdt analysis
nrep=`wc temperatures.dat | awk '{print $2}'` #where /media/lipinski/345fad8a-4774-4a42-9ee1-cb2ba5a0d23b/Dropbox/gtk_remd/1FME_1ns_3R2/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
	rm gdt-total_Ttraj.$ext.dat  
	rm gdt-total_Ttraj.$ext.dat2 
	clusco_cpu -t remd_total.$ext.pdb -s gdt -e ./LEAP/ -o gdt-total.$ext.dat
	sed s/"         0     "//g gdt-total.$ext.dat > gdt-total.$ext.dat2 
	mv gdt-total.$ext.dat2 gdt-total.$ext.dat
done                       
                           
echo " GDTs from total trajectories generated!! " 

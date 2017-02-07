#!/bin/bash -f
####This script is responsible of generating gdt analysis
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1unc_233/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
	rm gdt-total_Ttraj.$ext.dat  
	rm gdt-total_Ttraj.$ext.dat2 
	clusco_cpu -t remd_total.$ext.pdb -s gdt -e ./LEAP/ -o gdt-total.$ext.dat
	sed s/"         0     "//g gdt-total.$ext.dat > gdt-total.$ext.dat2 
	mv gdt-total.$ext.dat2 gdt-total.$ext.dat
done                       
                           
echo " GDTs from total trajectories generated!! " 

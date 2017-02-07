#!/bin/bash -f
####This script is responsible of generating gdt analysis
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/GTT_D1/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
	rm gdt-total_Ttraj.$ext.dat  
	rm gdt-total_Ttraj.$ext.dat2 
	clusco_cpu -t remd_total_Ttraj.$ext.pdb -s gdt -e ../LEAP/GTT_Pfirst.pdb  -o gdt-total_Ttraj.$ext.dat
	sed s/"         0     "//g gdt-total_Ttraj.$ext.dat > gdt-total_Ttraj.$ext.dat2 
	mv gdt-total_Ttraj.$ext.dat2 gdt-total_Ttraj.$ext.dat
done                       
                           
echo " GDTs from total trajectories generated!! " 

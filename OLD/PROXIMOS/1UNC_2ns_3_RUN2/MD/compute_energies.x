#!/bin/bash -f
####This script is responsible of generating Potential Energy trajectories
count=0
for ext in `cat temperatures.dat`
do                                
  let COUNT+=1                    
  REP=`printf "%03d" $COUNT`      
  rm -f energy_$ext.temp
  grep "EPtot" remd_001.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  grep "EPtot" remd_002.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  grep "EPtot" remd_003.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  grep "EPtot" remd_004.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  grep "EPtot" remd_005.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  grep "EPtot" remd_006.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp 
  python compute_energies.py energy_$ext.temp $ext energy_$ext.xvg
  rm -f energy_$ext.temp
done                       
                           
echo " Energies from total trajectories calculated! " 

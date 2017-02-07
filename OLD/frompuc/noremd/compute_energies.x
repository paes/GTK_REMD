#!/bin/bash


TEMPLIST=`cat temperatures.dat`


for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
	rm -f energy_$ext.temp	
	for cutoff in 001 002 003 004 005 006 ; do
#		echo "grep "EPtot" remd_$cutoff.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp"
		grep "EPtot" remd_$cutoff.mdout.$ext | awk -F' ' '{ print $9 }' | head -n -2 >> energy_$ext.temp
	done
	python compute_energies.py energy_$ext.temp $ext energy_$ext.xvg		
	rm -f energy_$ext.temp
done


#!/bin/bash

analyze_all_temps.x job_id ../$1_P.pdb 
generate_pdb_total.x job_id ../$1_P.pdb 
rmsd-from-Ttraj.x job_id ../$1_P.pdb 3 33
gdt-from-Ttraj.x
fi

chmod 777 *.x 
./analyze_all_temps.x job_id ../LEAP/GTT_Pfirst.pdb
./generate_pdb_total.x job_id ../LEAP/GTT_Pfirst.pdb 
./rmsd_from_traj.x job_id ../LEAP/GTT_Pfirst.pdb 
#./gdt_from_traj.x 
./compute_energies.x 

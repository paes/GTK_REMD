chmod 777 *.x 
./analyze_all_temps.x job_id ../LEAP/1E0N_Pfirst.pdb
./generate_pdb_total.x job_id ../LEAP/1E0N_Pfirst.pdb 
./rmsd_from_traj.x job_id ../LEAP/1E0N_Pfirst.pdb 
./gdt_from_traj.x 
./compute_energies.x 
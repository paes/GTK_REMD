
chmod 777 *.x
#./analyze_all_temps.x job_id ../1UNC01-Hs.pdb    NAO NECESSARIO - NO REMD
generate_pdb_total_002toobig_md.x job_id ../1UNC01-Hs.pdb 
rmsd-from-Ttraj_md.x job_id ../1UNC01-Hs.pdb 1 35
rmsd-from-Ttraj_md.x job_id ../1UNC01-Hs.pdb 3 33
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 1 35
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 3 33
gdt-from-Ttraj_md.x
./compute_energies.x

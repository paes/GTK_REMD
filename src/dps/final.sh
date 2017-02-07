#./analyze_all_temps.x job_id ../1UNC01-Hs.pdb    NAO NECESSARIO - NO REMD
generate_pdb_total-MD.x job_id ../1UNC01-Hs.pdb 
rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 1 35
rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 3 33
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 1 35
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 3 33
gdt-from-Ttraj.x
./compute_energies.x


chmod 777 *.sh
chmod 777 *.x

tleap -f ../LEAP/leap.in # depois de configurar o leap
cp job_id.prmtop ../LEAP
cp job_id.inpcrd ../LEAP
cp 1UNC_P.pdb ../LEAP
cp leap.log ../LEAP

#mpirun -np 32 $AMBERHOME/bin/sander.MPI -O -i mini_00.in -o mini_00.out -p ../LEAP/job_id.prmtop -c ../LEAP/job_id.inpcrd -r mini_000.rst
#tail mini_00.out > tail_000
#cp tail_000 /home/tars/Dropbox/Hulk_Thiago/TARS/

#$AMBERHOME/bin/ambpdb -p job_id.prmtop < job_id.inpcrd > job_id.pdb
#$AMBERHOME/bin/makeCHIR_RST job_id.pdb job_id_chir.dat #grandes temps



export CUDA_VISIBLE_DEVICES="0,1"
#indo direto para os mdgb_01 02 03 04 05 06
#./setup_equilibrate_input.x job_id
#mpirun -np 28 $AMBERHOME/bin/pmemd.cuda.MPI -ng 14 -groupfile equilibrate.groupfile
./setup_remd_allinputs.x job_id

./run_001.sh &
./run_002.sh &
./run_003.sh &
./run_004.sh &
./run_005.sh &
./run_006.sh &
./run_007.sh &
./run_008.sh &
./run_009.sh &
./run_010.sh &
./run_011.sh &
./run_012.sh &
./run_013.sh &
./run_014.sh

#chmod 777 *.x
#./analyze_all_temps.x job_id ../1UNC01-Hs.pdb  NAO NECESSARIO - NAO REMD
#./generate_ncdf_total.x job_id ../1UNC01-Hs.pdb 
#./rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 1 35
#./rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 3 33
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 1 35
#./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 3 33

#./compute_energies.x

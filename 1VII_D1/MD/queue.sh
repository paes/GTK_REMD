chmod 777 *.x *.sh
./get_from_tra.x 1rij.pdb 0
python remove_heatoms.py 1rij.pdb_0
pdb4amber -i 1rij.pdb_0 -o 1VII_P.pdb —ypd
cp 1VII_P.pdb ../LEAP/1VII_Pfirst.pdb
tleap -f ../LEAP/leap.in # depois de configurar o leap
cp job_id.prmtop ../LEAP
cp job_id.inpcrd ../LEAP
cp 1rij.pdb ../LEAP
cp 1VII_Pfirst.pdb ../LEAP
cp leap.log ../LEAP
mpirun -np 12 $AMBERHOME/bin/sander.MPI -O -i mini_00.in -o mini_00.out -p ../LEAP/job_id.prmtop -c ../LEAP/job_id.inpcrd -r mini_000.rst
$AMBERHOME/bin/ambpdb -p job_id.prmtop < job_id.inpcrd > job_id.pdb
$AMBERHOME/bin/makeCHIR_RST job_id.pdb job_id_chir.dat
export CUDA_VISIBLE_DEVICES="0,1"
./setup_remd_allinputs.x job_id  
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_001.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_002.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_003.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_004.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_005.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_006.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_007.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_008.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_009.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_010.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_011.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_012.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_013.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_014.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_015.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_016.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_017.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_018.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_019.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_020.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_002.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_003.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_004.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_005.groupfile
mpirun -machinefile machinefile -np 72 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_006.groupfile
cat rem_0*.log > rem_total.log
python EF.py > En_fun_total.txt

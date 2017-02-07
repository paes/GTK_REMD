chmod 777 *.x *.sh
./get_from_tra.x 1fme.pdb 0
python remove_heatoms.py 1fme.pdb_0
pdb4amber -i 1fme.pdb_0 -o 1FME_P.pdb —ypd
cp 1FME_P.pdb ../LEAP/1FME_Pfirst.pdb
tleap -f ../LEAP/leap.in # depois de configurar o leap
cp job_id.prmtop ../LEAP
cp job_id.inpcrd ../LEAP
cp 1fme.pdb ../LEAP
cp 1FME_Pfirst.pdb ../LEAP
cp leap.log ../LEAP
mpirun -np 12 $AMBERHOME/bin/sander.MPI -O -i mini_00.in -o mini_00.out -p ../LEAP/job_id.prmtop -c ../LEAP/job_id.inpcrd -r mini_000.rst
$AMBERHOME/bin/ambpdb -p job_id.prmtop < job_id.inpcrd > job_id.pdb
$AMBERHOME/bin/makeCHIR_RST job_id.pdb job_id_chir.dat
export CUDA_VISIBLE_DEVICES="0,1"
./setup_remd_allinputs.x job_id  
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_001.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_002.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_003.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_004.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_005.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_006.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_007.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_008.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_009.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_010.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_011.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_012.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_013.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_014.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_015.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_016.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_017.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_018.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_019.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_020.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_002.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_003.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_004.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_005.groupfile
mpirun -machinefile machinefile -np 70 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_006.groupfile
cat rem_001*.log > rem_total.log
python EF.py > En_fun_001.txt
cat rem_001*.log rem_002*.log  > rem_total.log
python EF.py > En_fun_002.txt
cat rem_001*.log rem_002*.log rem_003*.log  > rem_total.log
python EF.py > En_fun_003.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log  > rem_total.log
python EF.py > En_fun_004.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log  > rem_total.log
python EF.py > En_fun_005.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log rem_006*.log > rem_total.log
python EF.py > En_fun_006.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log rem_006*.log rem_007*.log > rem_total.log
python EF.py > En_fun_006.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log rem_006*.log rem_007*.log rem_008*.log > rem_total.log
python EF.py > En_fun_006.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log rem_006*.log rem_007*.log rem_008*.log rem_009*.log > rem_total.log
python EF.py > En_fun_006.txt
cat rem_001*.log rem_002*.log rem_003*.log rem_004*.log rem_005*.log rem_006*.log rem_007*.log rem_008*.log rem_009*.log rem_010*.log > rem_total.log
python EF.py > En_fun_006.txt
cat En_fun_0*.txt  > En_fun_total.txt

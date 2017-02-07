chomd 777 *.x
chmod 777 *.sh

tleap -f ../LEAP/leap.in # depois de configurar o leap
cp job_id.prmtop ../LEAP
cp job_id.inpcrd ../LEAP
cp 1UNC_P.pdb ../LEAP
cp leap.log ../LEAP

mpirun -np 24 $AMBERHOME/bin/sander.MPI -O -i mini_00.in -o mini_00.out -p ../LEAP/job_id.prmtop -c ../LEAP/job_id.inpcrd -r mini_000.rst
tail mini_00.out > tail_000
#cp tail_000 /home/tars/Dropbox/Hulk_Thiago/TARS/

$AMBERHOME/bin/ambpdb -p job_id.prmtop < job_id.inpcrd > job_id.pdb
$AMBERHOME/bin/makeCHIR_RST job_id.pdb job_id_chir.dat #grandes temps


#
export CUDA_VISIBLE_DEVICES="0,1"
#indo direto para os mdgb_01 02 03 04 05 06
#./setup_equilibrate_input.x job_id
#mpirun -np 126 $AMBERHOME/bin/pmemd.cuda.MPI -ng 14 -groupfile equilibrate.groupfile

./setup_remd_allinputs.x job_id
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_001.groupfile
tail remd_001_small_001.mdout.001 > tail_001_small_001.001-from-lad

mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_002.groupfile
tail remd_001_small_002.mdout.001 > tail_001_small_002.001-from-lad

mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_003.groupfile
tail remd_001_small_003.mdout.001 > tail_001_small_003.001-from-lad

mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_004.groupfile
tail remd_001_small_004.mdout.001 > tail_001_small_004.001-from-lad

mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_001_small_005.groupfile
tail remd_001_small_005.mdout.001 > tail_001_small_005.001-from-lad




#cp tail_001.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_002.groupfile
tail remd_002.mdout.001 > tail_002.001-from-lad
#cp tail_002.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_003.groupfile
tail remd_003.mdout.001 > tail_003.001-from-lad
#cp tail_003.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_004.groupfile
tail remd_004.mdout.001 > tail_004.001-from-lad
#cp tail_004.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_005.groupfile
tail remd_005.mdout.001 > tail_005.001-from-lad
#cp tail_005.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/
mpirun -machinefile machinefile -np 98 $AMBERHOME/bin/pmemd.MPI -ng 14 -groupfile remd_006.groupfile
tail remd_006.mdout.001 > tail_006.001-from-lad
#cp tail_006.001-from-thiago /home/tars/Dropbox/Hulk_Thiago/TARS/



#$como fica esse $AMBERHOME ?? source /usr/local/Amber/amber-vars.sh
#scp 
#sshfs
#filezilla
 
cat rem_001.log > rem_total.log
python EF.py > En_fun_001.txt

cat rem_001.log rem_002.log  > rem_total.log
python EF.py > En_fun_002.txt

cat rem_001.log rem_002.log rem_003.log  > rem_total.log
python EF.py > En_fun_003.txt

cat rem_001.log rem_002.log rem_003.log rem_004.log  > rem_total.log
python EF.py > En_fun_004.txt

cat rem_001.log rem_002.log rem_003.log rem_004.log rem_005.log  > rem_total.log
python EF.py > En_fun_005.txt

cat rem_001.log rem_002.log rem_003.log rem_004.log rem_005.log rem_006.log > rem_total.log
python EF.py > En_fun_006.txt

cat En_fun_001.txt En_fun_002.txt En_fun_003.txt En_fun_004.txt En_fun_005.txt En_fun_006.txt > En_fun_total.txt


chmod 777 *.x
./analyze_all_temps.x job_id ../1UNC01-Hs.pdb 
./generate_ncdf_total.x job_id ../1UNC01-Hs.pdb 
./rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 1 35
./rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 3 33
./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 1 35
./rmsd-from-Ttraj_CA.x job_id ../1UNC01-Hs.pdb 3 33



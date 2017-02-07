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
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1FME_1ns_4_R2/temperatures.dat is the temperature.dat complete path
count=0
for TEMP in `cat temperatures.dat`
do                                
  let COUNT+=1                    
  REP=`printf "%03d" $COUNT`      
  LAST=`printf "%03d" $nrep`      
  if [ $REP != $LAST ]
  then
  	./run_$REP.sh &
  else
	./run_$REP.sh
	fi
done                                

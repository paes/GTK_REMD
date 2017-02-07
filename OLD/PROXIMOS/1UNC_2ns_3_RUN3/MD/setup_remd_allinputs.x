#!/bin/bash -f
rm remd_*.groupfile
find . -name "run_*.sh" -exec rm {} \; 
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1unc_233/temperatures.dat is the temperature.dat complete path
count=0
for TEMP in `cat temperatures.dat`
do                                
  let COUNT+=1                    
  REP=`printf "%03d" $COUNT`      
  let igzito=26535                
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_001.log.$REP -i remd_001.mdin.$REP -c mini_000.rst -r remd_001.rst.$REP -x remd_001.ncdf.$REP -inf remd_001.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_001.mdout.$REP " >> run_$REP.sh
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_002.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_002.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_002.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_002.log.$REP -i remd_002.mdin.$REP -c remd_001.rst.$REP -r remd_002.rst.$REP -x remd_002.ncdf.$REP -inf remd_002.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_002.mdout.$REP" >> run_$REP.sh
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_003.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_003.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_003.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_003.log.$REP -i remd_003.mdin.$REP -c remd_002.rst.$REP -r remd_003.rst.$REP -x remd_003.ncdf.$REP -inf remd_003.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_003.mdout.$REP" >> run_$REP.sh
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_004.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_004.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_004.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_004.log.$REP -i remd_004.mdin.$REP -c remd_003.rst.$REP -r remd_004.rst.$REP -x remd_004.ncdf.$REP -inf remd_004.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_004.mdout.$REP" >> run_$REP.sh
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_005.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_005.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_005.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_005.log.$REP -i remd_005.mdin.$REP -c remd_004.rst.$REP -r remd_005.rst.$REP -x remd_005.ncdf.$REP -inf remd_005.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_005.mdout.$REP" >> run_$REP.sh
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_006.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_006.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_006.mdin.$REP
  echo "mpirun -np 6 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l remd_006.log.$REP -i remd_006.mdin.$REP -c remd_005.rst.$REP -r remd_006.rst.$REP -x remd_006.ncdf.$REP -inf remd_006.mdinfo.$REP -p ../LEAP/$1.prmtop -o remd_006.mdout.$REP" >> run_$REP.sh
  rm -f temp temp2

  echo "python set_end.py $REP " >> run_$REP.sh 
  echo "python verify_end.py" >> run_$REP.sh
  chmod 777 run_$REP.sh
done                 
                           
echo "N DIFFERENT MDS  = $nrep" 
echo " Done." 

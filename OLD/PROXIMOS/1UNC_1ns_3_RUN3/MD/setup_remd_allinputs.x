#!/bin/bash -f
rm remd_*.groupfile
find . -name "run_*.sh" -exec rm {} \; 
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1unc_133/temperatures.dat is the temperature.dat complete path
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
  echo "python set_end.py $REP " >> run_$REP.sh 
  echo "python verify_end.py" >> run_$REP.sh
  chmod 777 run_$REP.sh
done                 
                           
echo "N DIFFERENT MDS  = $nrep" 
echo " Done." 

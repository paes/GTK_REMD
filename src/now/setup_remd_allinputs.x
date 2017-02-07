#!/bin/bash -f

if [ -f groupfile ];
then
  rm groupfile
fi

rm remd_001_small_001.groupfile remd_001_small_002.groupfile remd_001_small_003.groupfile  remd_001_small_004.groupfile remd_001_small_005.groupfile remd_002.groupfile remd_003.groupfile remd_004.groupfile remd_005.groupfile remd_006.groupfile

nrep=`wc temperatures.dat | awk '{print $2}'`
echo $nrep
count=0
for TEMP in `cat temperatures.dat`
do
  let COUNT+=1
  REP=`printf "%03d" $COUNT`
  let igzito=77777

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_001.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_001.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_001.mdin.$REP
  echo "-O -rem 1 -remlog rem_001_small_001.log -i remd_001_small_001.mdin.$REP -o remd_001_small_001.mdout.$REP -c mini_000.rst -r remd_001_small_001.rst.$REP -x remd_001_small_001.ncdf.$REP -inf remd_001_small_001.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_001.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_002.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_002.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_002.mdin.$REP
  echo "-O -rem 1 -remlog rem_001_small_002.log -i remd_001_small_002.mdin.$REP -o remd_001_small_002.mdout.$REP -c remd_001_small_001.rst.$REP -r remd_001_small_002.rst.$REP -x remd_001_small_002.ncdf.$REP -inf remd_001_small_002.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_002.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_003.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_003.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_003.mdin.$REP
  echo "-O -rem 1 -remlog rem_001_small_003.log -i remd_001_small_003.mdin.$REP -o remd_001_small_003.mdout.$REP -c remd_001_small_002.rst.$REP -r remd_001_small_003.rst.$REP -x remd_001_small_003.ncdf.$REP -inf remd_001_small_003.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_003.groupfile
  rm -f temp temp2


  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_004.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_004.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_004.mdin.$REP
  echo "-O -rem 1 -remlog rem_001_small_004.log -i remd_001_small_004.mdin.$REP -o remd_001_small_004.mdout.$REP -c remd_001_small_003.rst.$REP -r remd_001_small_004.rst.$REP -x remd_001_small_004.ncdf.$REP -inf remd_001_small_004.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_004.groupfile
  rm -f temp temp2


  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_005.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_005.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_005.mdin.$REP
  echo "-O -rem 1 -remlog rem_001_small_005.log -i remd_001_small_005.mdin.$REP -o remd_001_small_005.mdout.$REP -c remd_001_small_004.rst.$REP -r remd_001_small_005.rst.$REP -x remd_001_small_005.ncdf.$REP -inf remd_001_small_005.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_005.groupfile
  rm -f temp temp2
 
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_002.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_002.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_002.mdin.$REP
  echo "-O -rem 1 -remlog rem_002.log -i remd_002.mdin.$REP -o remd_002.mdout.$REP -c remd_001_small_005.rst.$REP -r remd_002.rst.$REP -x remd_002.ncdf.$REP -inf remd_002.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_002.groupfile
  rm -f temp temp2
  
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_003.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_003.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_003.mdin.$REP
  echo "-O -rem 1 -remlog rem_003.log -i remd_003.mdin.$REP -o remd_003.mdout.$REP -c remd_002.rst.$REP -r remd_003.rst.$REP -x remd_003.ncdf.$REP -inf remd_003.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_003.groupfile
  rm -f temp temp2
  
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_004.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_004.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_004.mdin.$REP
  echo "-O -rem 1 -remlog rem_004.log -i remd_004.mdin.$REP -o remd_004.mdout.$REP -c remd_003.rst.$REP -r remd_004.rst.$REP -x remd_004.ncdf.$REP -inf remd_004.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_004.groupfile
  rm -f temp temp2
  
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_005.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_005.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_005.mdin.$REP
  echo "-O -rem 1 -remlog rem_005.log -i remd_005.mdin.$REP -o remd_005.mdout.$REP -c remd_004.rst.$REP -r remd_005.rst.$REP -x remd_005.ncdf.$REP -inf remd_005.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_005.groupfile 
  rm -f temp temp2
  
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_006.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_006.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_006.mdin.$REP
  echo "-O -rem 1 -remlog rem_006.log -i remd_006.mdin.$REP -o remd_006.mdout.$REP -c remd_005.rst.$REP -r remd_006.rst.$REP -x remd_006.ncdf.$REP -inf remd_006.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_006.groupfile
  rm -f temp temp2  
done
echo "#" >> groupfile

echo "N REPLICAS  = $nrep"
echo " Done."

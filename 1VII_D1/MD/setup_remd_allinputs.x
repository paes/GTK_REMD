#!/bin/bash -f
rm remd_*.groupfile
find . -name "run_*.sh" -exec rm {} \; 
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1VII_D1/temperatures.dat is the temperature.dat complete path
count=0
for TEMP in `cat temperatures.dat`
do                                
  let COUNT+=1                    
  REP=`printf "%03d" $COUNT`      
  let igzito=7777                
  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_001.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_001.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_001.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_001.log -i remd_001_small_001.mdin.$REP -o remd_001_small_001.mdout.$REP -c mini_000.rst -r remd_001_small_001.rst.$REP -x remd_001_small_001.ncdf.$REP -inf remd_001_small_001.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_001.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_002.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_002.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_002.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_002.log -i remd_001_small_002.mdin.$REP -o remd_001_small_002.mdout.$REP -c remd_001_small_001.rst.$REP -r remd_001_small_002.rst.$REP -x remd_001_small_002.ncdf.$REP -inf remd_001_small_002.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_002.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_003.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_003.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_003.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_003.log -i remd_001_small_003.mdin.$REP -o remd_001_small_003.mdout.$REP -c remd_001_small_002.rst.$REP -r remd_001_small_003.rst.$REP -x remd_001_small_003.ncdf.$REP -inf remd_001_small_003.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_003.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_004.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_004.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_004.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_004.log -i remd_001_small_004.mdin.$REP -o remd_001_small_004.mdout.$REP -c remd_001_small_003.rst.$REP -r remd_001_small_004.rst.$REP -x remd_001_small_004.ncdf.$REP -inf remd_001_small_004.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_004.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_005.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_005.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_005.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_005.log -i remd_001_small_005.mdin.$REP -o remd_001_small_005.mdout.$REP -c remd_001_small_004.rst.$REP -r remd_001_small_005.rst.$REP -x remd_001_small_005.ncdf.$REP -inf remd_001_small_005.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_005.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_006.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_006.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_006.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_006.log -i remd_001_small_006.mdin.$REP -o remd_001_small_006.mdout.$REP -c remd_001_small_005.rst.$REP -r remd_001_small_006.rst.$REP -x remd_001_small_006.ncdf.$REP -inf remd_001_small_006.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_006.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_007.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_007.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_007.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_007.log -i remd_001_small_007.mdin.$REP -o remd_001_small_007.mdout.$REP -c remd_001_small_006.rst.$REP -r remd_001_small_007.rst.$REP -x remd_001_small_007.ncdf.$REP -inf remd_001_small_007.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_007.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_008.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_008.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_008.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_008.log -i remd_001_small_008.mdin.$REP -o remd_001_small_008.mdout.$REP -c remd_001_small_007.rst.$REP -r remd_001_small_008.rst.$REP -x remd_001_small_008.ncdf.$REP -inf remd_001_small_008.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_008.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_009.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_009.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_009.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_009.log -i remd_001_small_009.mdin.$REP -o remd_001_small_009.mdout.$REP -c remd_001_small_008.rst.$REP -r remd_001_small_009.rst.$REP -x remd_001_small_009.ncdf.$REP -inf remd_001_small_009.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_009.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_010.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_010.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_010.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_010.log -i remd_001_small_010.mdin.$REP -o remd_001_small_010.mdout.$REP -c remd_001_small_009.rst.$REP -r remd_001_small_010.rst.$REP -x remd_001_small_010.ncdf.$REP -inf remd_001_small_010.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_010.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_011.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_011.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_011.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_011.log -i remd_001_small_011.mdin.$REP -o remd_001_small_011.mdout.$REP -c remd_001_small_010.rst.$REP -r remd_001_small_011.rst.$REP -x remd_001_small_011.ncdf.$REP -inf remd_001_small_011.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_011.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_012.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_012.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_012.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_012.log -i remd_001_small_012.mdin.$REP -o remd_001_small_012.mdout.$REP -c remd_001_small_011.rst.$REP -r remd_001_small_012.rst.$REP -x remd_001_small_012.ncdf.$REP -inf remd_001_small_012.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_012.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_013.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_013.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_013.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_013.log -i remd_001_small_013.mdin.$REP -o remd_001_small_013.mdout.$REP -c remd_001_small_012.rst.$REP -r remd_001_small_013.rst.$REP -x remd_001_small_013.ncdf.$REP -inf remd_001_small_013.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_013.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_014.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_014.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_014.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_014.log -i remd_001_small_014.mdin.$REP -o remd_001_small_014.mdout.$REP -c remd_001_small_013.rst.$REP -r remd_001_small_014.rst.$REP -x remd_001_small_014.ncdf.$REP -inf remd_001_small_014.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_014.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_015.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_015.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_015.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_015.log -i remd_001_small_015.mdin.$REP -o remd_001_small_015.mdout.$REP -c remd_001_small_014.rst.$REP -r remd_001_small_015.rst.$REP -x remd_001_small_015.ncdf.$REP -inf remd_001_small_015.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_015.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_016.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_016.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_016.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_016.log -i remd_001_small_016.mdin.$REP -o remd_001_small_016.mdout.$REP -c remd_001_small_015.rst.$REP -r remd_001_small_016.rst.$REP -x remd_001_small_016.ncdf.$REP -inf remd_001_small_016.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_016.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_017.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_017.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_017.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_017.log -i remd_001_small_017.mdin.$REP -o remd_001_small_017.mdout.$REP -c remd_001_small_016.rst.$REP -r remd_001_small_017.rst.$REP -x remd_001_small_017.ncdf.$REP -inf remd_001_small_017.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_017.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_018.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_018.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_018.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_018.log -i remd_001_small_018.mdin.$REP -o remd_001_small_018.mdout.$REP -c remd_001_small_017.rst.$REP -r remd_001_small_018.rst.$REP -x remd_001_small_018.ncdf.$REP -inf remd_001_small_018.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_018.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_019.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_019.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_019.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_019.log -i remd_001_small_019.mdin.$REP -o remd_001_small_019.mdout.$REP -c remd_001_small_018.rst.$REP -r remd_001_small_019.rst.$REP -x remd_001_small_019.ncdf.$REP -inf remd_001_small_019.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_019.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_001_small_020.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_001_small_020.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_001_small_020.mdin.$REP
  echo "-O -rem 1 -remlog remd_001_small_020.log -i remd_001_small_020.mdin.$REP -o remd_001_small_020.mdout.$REP -c remd_001_small_019.rst.$REP -r remd_001_small_020.rst.$REP -x remd_001_small_020.ncdf.$REP -inf remd_001_small_020.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_001_small_020.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_002.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_002.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_002.mdin.$REP
  echo "-O -rem 1 -remlog remd_002.log -i remd_002.mdin.$REP -o remd_002.mdout.$REP -c remd_001_small_020.rst.$REP -r remd_002.rst.$REP -x remd_002.ncdf.$REP -inf remd_002.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_002.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_003.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_003.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_003.mdin.$REP
  echo "-O -rem 1 -remlog remd_003.log -i remd_003.mdin.$REP -o remd_003.mdout.$REP -c remd_002.rst.$REP -r remd_003.rst.$REP -x remd_003.ncdf.$REP -inf remd_003.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_003.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_004.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_004.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_004.mdin.$REP
  echo "-O -rem 1 -remlog remd_004.log -i remd_004.mdin.$REP -o remd_004.mdout.$REP -c remd_003.rst.$REP -r remd_004.rst.$REP -x remd_004.ncdf.$REP -inf remd_004.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_004.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_005.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_005.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_005.mdin.$REP
  echo "-O -rem 1 -remlog remd_005.log -i remd_005.mdin.$REP -o remd_005.mdout.$REP -c remd_004.rst.$REP -r remd_005.rst.$REP -x remd_005.ncdf.$REP -inf remd_005.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_005.groupfile
  rm -f temp temp2

  echo "TEMPERATURE: $TEMP K ==> FILE: remd_006.mdin.$REP"
  sed "s/XXXXX/$TEMP/g" remd_006.mdin > temp
  sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
  sed "s/job_id/$1/g" temp2 > remd_006.mdin.$REP
  echo "-O -rem 1 -remlog remd_006.log -i remd_006.mdin.$REP -o remd_006.mdout.$REP -c remd_005.rst.$REP -r remd_006.rst.$REP -x remd_006.ncdf.$REP -inf remd_006.mdinfo.$REP -p ../LEAP/$1.prmtop" >> remd_006.groupfile
  rm -f temp temp2

done                       
echo "#" >> groupfile     
  echo "python set_end.py $REP " >> run_$REP.sh 
  echo "python verify_end.py" >> run_$REP.sh
  chmod 777 run_$REP.sh
                           
echo "N DIFFERENT MDS  = $nrep" 
echo " Done." 

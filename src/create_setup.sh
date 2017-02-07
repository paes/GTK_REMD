#!/bin/bash


#inputs-> outputfolder, temperatures.dat, job_id , seed_number, simulation_type , num_processes, machinefile
nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/setup_remd_allinputs.x
echo "rm remd_*.groupfile" >> $1/MD/setup_remd_allinputs.x
echo "find . -name \"run_*.sh\" -exec rm {} \; " >> $1/MD/setup_remd_allinputs.x

echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/setup_remd_allinputs.x

echo "count=0" >> $1/MD/setup_remd_allinputs.x
echo "for TEMP in \`cat temperatures.dat\`" >> $1/MD/setup_remd_allinputs.x
echo "do                                " >> $1/MD/setup_remd_allinputs.x
echo "  let COUNT+=1                    " >> $1/MD/setup_remd_allinputs.x
echo "  REP=\`printf \"%03d\" \$COUNT\`      " >> $1/MD/setup_remd_allinputs.x
echo "  let igzito=$4                " >> $1/MD/setup_remd_allinputs.x

simulation_type=$5
if [ "$simulation_type" -lt "2" ] 
then
	#echo "$simulation_type"  >> $1/MD/setup_remd_allinputs.x
	oldmdinfile=mini_000
	#echo "aqui"
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		#echo "$mdinfile"  >> $1/MD/setup_remd_allinputs.x
		#echo "$mdinfile"  >> $1/MD/setup_remd_allinputs.x
		#echo "$mdinfile"  >> $1/MD/setup_remd_allinputs.x
		echo "  echo \"TEMPERATURE: \$TEMP K ==> FILE: $mdinfile.mdin.\$REP\"" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/XXXXX/\$TEMP/g\" $mdinfile.mdin > temp" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/RANDOM_NUMBER/\$igzito/g\" temp > temp2" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/job_id/\$1/g\" temp2 > $mdinfile.mdin.\$REP" >> $1/MD/setup_remd_allinputs.x
		if [ $oldmdinfile == mini_000 ]
		then
			echo "  echo \"-O -rem 1 -remlog $mdinfile.log -i $mdinfile.mdin.\$REP -o $mdinfile.mdout.\$REP -c $oldmdinfile.rst -r $mdinfile.rst.\$REP -x $mdinfile.ncdf.\$REP -inf $mdinfile.mdinfo.\$REP -p ../LEAP/\$1.prmtop\" >> $mdinfile.groupfile" >> $1/MD/setup_remd_allinputs.x
		else
			echo "  echo \"-O -rem 1 -remlog $mdinfile.log -i $mdinfile.mdin.\$REP -o $mdinfile.mdout.\$REP -c $oldmdinfile.rst.\$REP -r $mdinfile.rst.\$REP -x $mdinfile.ncdf.\$REP -inf $mdinfile.mdinfo.\$REP -p ../LEAP/\$1.prmtop\" >> $mdinfile.groupfile" >> $1/MD/setup_remd_allinputs.x
		fi
		echo "  rm -f temp temp2" >> $1/MD/setup_remd_allinputs.x
		echo "" >> $1/MD/setup_remd_allinputs.x
		oldmdinfile=$mdinfile
	#	echo $oldmdinfile
	done
	echo "done                       " >> $1/MD/setup_remd_allinputs.x
	echo "echo \"#\" >> groupfile     " >> $1/MD/setup_remd_allinputs.x
else
	oldmdinfile=mini_000
 #echo "TEMPERATURE: $TEMP K ==> FILE: remd_001.mdin.$REP"
 #sed "s/XXXXX/$TEMP/g" remd_001.mdin > temp
 #sed "s/RANDOM_NUMBER/$igzito/g" temp > temp2
 #sed "s/job_id/$1/g" temp2 > remd_001.mdin.$REP
 #echo "mpirun -np 5 -machinefile machinefile $AMBERHOME/bin/pmemd.MPI -O -l log_001.$REP -i remd_001.mdin.$REP 
 #-c mini_000.rst -r remd_001.rst.$REP -x remd_001.ncdf.$REP -inf remd_001.mdinfo.$REP -p ../LEAP/job_id.prmtop -o remd_001.mdout.$REP" >> run_$REP.sh
 #rm -f temp temp2
 #chmod 777 run_$REP.sh
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		echo "  echo \"TEMPERATURE: \$TEMP K ==> FILE: $mdinfile.mdin.\$REP\"" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/XXXXX/\$TEMP/g\" $mdinfile.mdin > temp" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/RANDOM_NUMBER/\$igzito/g\" temp > temp2" >> $1/MD/setup_remd_allinputs.x
		echo "  sed \"s/job_id/\$1/g\" temp2 > $mdinfile.mdin.\$REP" >> $1/MD/setup_remd_allinputs.x
		num_proc=$(($6/$nrep))
		# REMEMBER THAT WITHOUT REMD I HAVE $mdinfile.log.\$REP INSTEAD OF $mdinfile.log
		if [ $oldmdinfile == mini_000 ]
		then
			echo "  echo \"mpirun -np $num_proc -machinefile $7 \$AMBERHOME/bin/pmemd.MPI -O -l $mdinfile.log.\$REP -i $mdinfile.mdin.\$REP -c $oldmdinfile.rst -r $mdinfile.rst.\$REP -x $mdinfile.ncdf.\$REP -inf $mdinfile.mdinfo.\$REP -p ../LEAP/\$1.prmtop -o $mdinfile.mdout.\$REP \" >> run_\$REP.sh" >> $1/MD/setup_remd_allinputs.x
		else
			echo "  echo \"mpirun -np $num_proc -machinefile $7 \$AMBERHOME/bin/pmemd.MPI -O -l $mdinfile.log.\$REP -i $mdinfile.mdin.\$REP -c $oldmdinfile.rst.\$REP -r $mdinfile.rst.\$REP -x $mdinfile.ncdf.\$REP -inf $mdinfile.mdinfo.\$REP -p ../LEAP/\$1.prmtop -o $mdinfile.mdout.\$REP\" >> run_\$REP.sh" >> $1/MD/setup_remd_allinputs.x
		fi
		echo "  rm -f temp temp2" >> $1/MD/setup_remd_allinputs.x
		echo "" >> $1/MD/setup_remd_allinputs.x
		oldmdinfile=$mdinfile
	#	echo $oldmdinfile
	done
	#echo "done                       " >> $1/MD/setup_remd_allinputs.x
fi

####echo "  echo \"lista=\`cat temperatures.dat\` \" >> run_\$REP.sh" >> $1/MD/setup_remd_allinputs.x
echo "  echo \"python set_end.py \$REP \" >> run_\$REP.sh ">> $1/MD/setup_remd_allinputs.x
#echo "  echo \" python verify_end.py eee aa lista->>>> \$lista \"" >> $1/MD/setup_remd_allinputs.x
#echo "  echo \" python verify_end.py eee aa lista->>>> \$lista \"" >> $1/MD/setup_remd_allinputs.x
echo "  echo \"python verify_end.py\" >> run_\$REP.sh"  >> $1/MD/setup_remd_allinputs.x
echo "  chmod 777 run_\$REP.sh" >> $1/MD/setup_remd_allinputs.x
#echo "done                 " >> $1/MD/setup_remd_allinputs.x

echo "                           " >> $1/MD/setup_remd_allinputs.x
echo "echo \"N DIFFERENT MDS  = \$nrep\" " >> $1/MD/setup_remd_allinputs.x
echo "echo \" Done.\" " >> $1/MD/setup_remd_allinputs.x


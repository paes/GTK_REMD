#!/bin/bash


nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/rmsd_from_traj.x
echo "####This script is responsible of generating rmsd/radgyr analysis (needs cpptraj AMBER)" >> $1/MD/gdt_from_traj.x
echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/rmsd_from_traj.x
echo "for ext in \`cat temperatures.dat\` ; do" >> $1/MD/rmsd_from_traj.x
simulation_type=$3
ca=$4
bb=$5
start=$6
end=$7

#echo "$simulation_type"
#echo "$simulation_type"
if [ "$rmsd" = "1" ]
then
	echo "	rm rmsd-total_Ttraj_$start-$end.\$ext.dat   " >> $1/MD/rmsd_from_traj.x
	echo "	rm rmsd-total_Ttraj_$start-$end.CA.\$ext.dat" >> $1/MD/rmsd_from_traj.x
fi

rmsd=$8
rmsd_done="0"
radgyr=$9
radgyr_done="0"
echo $8
echo $9
if [ "$rmsd" = "1" ]
then
	echo "RMSD is ON"
	echo "Generating RMSD"
	if [ "$radgyr" = "1" ] # SE TA LIGADO O RADGYR: rm radgyr-total_Ttraj.$ext.dat
	then
		#echo "entered here2"
		echo "	rm radgyr-total_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
	fi
	if [ "$simulation_type" -lt "2" ] 
	then
		if [ "$bb" = "True" ] 
		then
			echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
			echo "		trajin remd_00*.Ttraj.\$ext " >> $1/MD/rmsd_from_traj.x
			#echo "		trajin remd_total_Ttraj.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
			echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
			echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
			echo "		rms remd_00*.Ttraj.\$ext ref [pdb-file] :$start-$end@CA,C,N :$start-$end@CA,C,N out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			#echo "		rms remd_total_Ttraj.\$ext.pdb ref [pdb-file] :$start-$end@CA,C,N :$start-$end@CA,C,N out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			if [ "$radgyr_done" = "0" ] && [ "$radgyr" = "1" ]
			then ##SE TA LIGADO RADGYR AND DONE=0: radgyr out radgyr_Ttraj.\$ext.dat DONE =1
				echo "radgyr is ON"
				echo "Generating radgyr"
				echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
				radgyr_done="1"
			fi
			echo "EOF" >> $1/MD/rmsd_from_traj.x
			echo "" >> $1/MD/rmsd_from_traj.x
		fi
		if [ "$ca" = "True" ] 
		then
			echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
			echo "		trajin remd_00*.Ttraj.\$ext " >> $1/MD/rmsd_from_traj.x
			#echo "		trajin remd_total_Ttraj.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
			echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
			echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
			echo "		rms remd_00*.Ttraj.\$ext ref [pdb-file] :$start-$end@CA :$start-$end@CA,C,N out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			#echo "		rms remd_total_Ttraj.\$ext.pdb ref [pdb-file] :$start-$end@CA :$start-$end@CA out rmsd-total_Ttraj_$start-$end.CA.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			if [ "$radgyr_done" = "0" ] && [ "$radgyr" = "1" ]
			then ##SE TA LIGADO RADGYR AND DONE=0: radgyr out radgyr_Ttraj.\$ext.dat DONE =1
				echo "radgyr is ON"
				echo "Generating radgyr"
				echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
				radgyr_done="1"
			fi
			echo "EOF" >> $1/MD/rmsd_from_traj.x
			echo "" >> $1/MD/rmsd_from_traj.x
		fi
		echo "done                       " >> $1/MD/rmsd_from_traj.x
	else
		if [ "$bb" = "True" ] 
		then
			echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
			echo "		trajin remd_00*.\$ext " >> $1/MD/rmsd_from_traj.x
			#echo "		trajin remd_total.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
			echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
			echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
			echo "		rms remd_00*.\$ext ref [pdb-file] :$start-$end@CA,C,N :$start-$end@CA,C,N out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			#echo "		rms remd_total.\$ext.pdb ref [pdb-file] :$start-$end@CA,C,N :$start-$end@CA,C,N out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			if [ "$radgyr_done" = "0" ] && [ "$radgyr" = "1" ]
			then ##SE TA LIGADO RADGYR AND DONE=0: radgyr out radgyr_Ttraj.\$ext.dat DONE =1
				echo "radgyr is ON"
				echo "Generating radgyr"
				echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
				radgyr_done="1"
			fi
			echo "EOF" >> $1/MD/rmsd_from_traj.x
			echo "" >> $1/MD/rmsd_from_traj.x
		fi
		if [ "$ca" = "True" ] 
		then
			echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
			echo "		trajin remd_00*.\$ext " >> $1/MD/rmsd_from_traj.x
			#echo "		trajin remd_total.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
			echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
			echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
			echo "		rms remd_00*.\$ext ref [pdb-file] :$start-$end@CA :$start-$end@CA out rmsd-total_Ttraj_$start-$end.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			#echo "		rms remd_total.\$ext.pdb ref [pdb-file] :$start-$end@CA :$start-$end@CA out rmsd-total_Ttraj_$start-$end.CA.\$ext.dat" >> $1/MD/rmsd_from_traj.x
			if [ "$radgyr_done" = "0" ] && [ "$radgyr" = "1" ]
			then ##SE TA LIGADO RADGYR AND DONE=0: radgyr out radgyr_Ttraj.\$ext.dat DONE =1
				echo "radgyr is ON"
				echo "Generating radgyr"
				echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
				radgyr_done="1"
			fi
			echo "EOF" >> $1/MD/rmsd_from_traj.x
			echo "" >> $1/MD/rmsd_from_traj.x
		fi
		echo "done                       " >> $1/MD/rmsd_from_traj.x
	fi	
else
	echo "RMSD is OFF"
	echo "Generating just radgyr"
	if [ "$rmsd" = "1" ]
	then
		echo "	rm rm radgyr-total_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
	fi
	if [ "$simulation_type" -lt "2" ] 
	then
		echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
		echo "		trajin remd_00*.Ttraj.\$ext " >> $1/MD/rmsd_from_traj.x
		#echo "		trajin remd_total_Ttraj.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
		echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
		echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
		echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
	else
		echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/rmsd_from_traj.x
		echo "		trajin remd_00*.\$ext " >> $1/MD/rmsd_from_traj.x
		#echo "		trajin remd_total.\$ext.pdb " >> $1/MD/rmsd_from_traj.x
		echo "		parm \$2 " >> $1/MD/rmsd_from_traj.x
		echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/rmsd_from_traj.x
		echo "		radgyr out radgyr_Ttraj.\$ext.dat" >> $1/MD/rmsd_from_traj.x
	fi

fi
echo "                           " >> $1/MD/rmsd_from_traj.x
echo "echo \" RMSDs and/or RADGYR from total trajectories generated! \" " >> $1/MD/rmsd_from_traj.x

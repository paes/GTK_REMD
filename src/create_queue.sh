#!/bin/bash



#inputs-> outputfolder, temperatues.dat, number_of_processes, job_id , reference_structure(full path) , simulation_type, machinefile

nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path
LAST=`printf "%03d" $nrep`


#set job_id = $4
simulation_type=$6
reference_structure=$5
reference_structure=$(basename $reference_structure)
#echo "$reference_structure"
#pwd - estou dentro de src
cp ../pdb_inputs/$reference_structure  $1/MD/$reference_structure
echo "chmod 777 *.x *.sh" > $1/MD/queue.sh
echo "./get_from_tra.x $reference_structure 0" >> $1/MD/queue.sh	#grava o modelo 0 na mesma pasta em que esta o modelo completo.
underzero="_0"
reference_structure="$reference_structure$underzero"
echo "python remove_heatoms.py $reference_structure" >> $1/MD/queue.sh  #modifica o arquivo _0, deixando o mesmo nome mas tirando heatoms
echo "pdb4amber -i $reference_structure -o $4_P.pdb —ypd" >> $1/MD/queue.sh 


echo "cp $4_P.pdb ../LEAP/$4_Pfirst.pdb" >> $1/MD/queue.sh #copio da pasta atual e mando para ....
echo "tleap -f ../LEAP/leap.in # depois de configurar o leap" >> $1/MD/queue.sh
echo "cp job_id.prmtop ../LEAP" >> $1/MD/queue.sh
echo "cp job_id.inpcrd ../LEAP" >> $1/MD/queue.sh

reference_structure=$5
reference_structure=$(basename $reference_structure)

echo "cp $reference_structure ../LEAP" >> $1/MD/queue.sh  #esse $4 precisa virar o ref structure
echo "cp $4_Pfirst.pdb ../LEAP" >> $1/MD/queue.sh
echo "cp leap.log ../LEAP" >> $1/MD/queue.sh


# setup_remd_allinputs é o que gera todas os arquivos mdin, de cada replica, ou os run_001.sh mas 
#atualmente esse script nao gera as coisas automaticamente

echo "mpirun -np 12 \$AMBERHOME/bin/sander.MPI -O -i mini_00.in -o mini_00.out -p ../LEAP/job_id.prmtop -c ../LEAP/job_id.inpcrd -r mini_000.rst" >> $1/MD/queue.sh

echo "\$AMBERHOME/bin/ambpdb -p job_id.prmtop < job_id.inpcrd > job_id.pdb" >> $1/MD/queue.sh
echo "\$AMBERHOME/bin/makeCHIR_RST job_id.pdb job_id_chir.dat" >> $1/MD/queue.sh	#grandes temps

echo "export CUDA_VISIBLE_DEVICES=\"0,1\"" >> $1/MD/queue.sh
echo "./setup_remd_allinputs.x job_id  " >> $1/MD/queue.sh


if [ "$simulation_type" -lt "2" ] 
then
    echo "Cool Beans"
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		#echo $mdinfile
		#pwd
		echo "mpirun -machinefile $7 -np $3 \$AMBERHOME/bin/pmemd.MPI -ng $nrep -groupfile $mdinfile.groupfile" >> $1/MD/queue.sh
		#echo "tail $mdinfile.mdout.001 > tail_$mdinfile" >> $1/MD/queue.sh
	done
	
	echo "cat rem_0*.log > rem_total.log" >> $1/MD/queue.sh
	echo "python EF.py > En_fun_total.txt" >> $1/MD/queue.sh
		
else
    echo "Not Cool Beans"
    echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/queue.sh
	echo "count=0" >> $1/MD/queue.sh
	echo "for TEMP in \`cat temperatures.dat\`" >> $1/MD/queue.sh
	echo "do                                " >> $1/MD/queue.sh
	echo "  let COUNT+=1                    " >> $1/MD/queue.sh
	echo "  REP=\`printf \"%03d\" \$COUNT\`      " >> $1/MD/queue.sh
	echo "  LAST=\`printf \"%03d\" \$nrep\`      " >> $1/MD/queue.sh
	echo "  if [ "\$REP" != "\$LAST" ]" >> $1/MD/queue.sh
	echo "  then" >> $1/MD/queue.sh
	echo "  	./run_\$REP.sh &" >> $1/MD/queue.sh
	echo "  else" >> $1/MD/queue.sh
	echo "	./run_\$REP.sh"  >> $1/MD/queue.sh
	echo "	fi"  >> $1/MD/queue.sh
	echo "done                                " >> $1/MD/queue.sh    
fi



#!/bin/bash


nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/gdt_from_traj.x
echo "####This script is responsible of generating gdt analysis" >> $1/MD/gdt_from_traj.x

echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/gdt_from_traj.x
echo "for ext in \`cat temperatures.dat\` ; do" >> $1/MD/gdt_from_traj.x
simulation_type=$3
echo "	rm gdt-total_Ttraj.\$ext.dat  " >> $1/MD/gdt_from_traj.x
echo "	rm gdt-total_Ttraj.\$ext.dat2 " >> $1/MD/gdt_from_traj.x
job_id=$4
additional="Pfirst.pdb"

echo "ouput create_gdt"
echo $4
reference_file="${job_id}_${additional}"
echo $reference_file
if [ "$simulation_type" -lt "2" ] 
then
	echo "	clusco_cpu -t remd_total_Ttraj.\$ext.pdb -s gdt -e ../LEAP/$reference_file  -o gdt-total_Ttraj.\$ext.dat" >> $1/MD/gdt_from_traj.x
	echo "	sed s/\"         0     \"//g gdt-total_Ttraj.\$ext.dat > gdt-total_Ttraj.\$ext.dat2 " >> $1/MD/gdt_from_traj.x
	echo "	mv gdt-total_Ttraj.\$ext.dat2 gdt-total_Ttraj.\$ext.dat" >> $1/MD/gdt_from_traj.x
else
	echo "	clusco_cpu -t remd_total.\$ext.pdb -s gdt -e ../LEAP/$reference_file -o gdt-total.\$ext.dat" >> $1/MD/gdt_from_traj.x
	echo "	sed s/\"         0     \"//g gdt-total.\$ext.dat > gdt-total.\$ext.dat2 " >> $1/MD/gdt_from_traj.x
	echo "	mv gdt-total.\$ext.dat2 gdt-total.\$ext.dat" >> $1/MD/gdt_from_traj.x
fi
echo "done                       " >> $1/MD/gdt_from_traj.x

echo "                           " >> $1/MD/gdt_from_traj.x
echo "echo \" GDTs from total trajectories generated!! \" " >> $1/MD/gdt_from_traj.x

#!/bin/bash


nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/generate_pdb_total.x
echo "####This script is responsible of generating pdb trajectories from ncdf(binary) files. PDB format is common entry for analysis programs." >> $1/MD/generate_pdb_total.x

echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/generate_pdb_total.x
echo "for ext in \`cat temperatures.dat\` ; do" >> $1/MD/generate_pdb_total.x
simulation_type=$3
#echo "$simulation_type"
#echo "$simulation_type"

echo "ouput generate_pdb"
echo $4
echo $5
job_id=$4
additional="Pfirst.pdb"

reference_file="${job_id}_${additional}"
echo $reference_file



if [ "$simulation_type" -lt "2" ] 
then
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		#echo "$mdinfile" >> $1/MD/generate_pdb_total.x
		echo "		rm $mdinfile.Ttraj.\$ext.pdb" >> $1/MD/generate_pdb_total.x
		echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/generate_pdb_total.x
		echo "		trajin $mdinfile.Ttraj.\$ext " >> $1/MD/generate_pdb_total.x
		echo "		parm \$2 " >> $1/MD/generate_pdb_total.x
		echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/generate_pdb_total.x
		echo "		trajout remd_total_Ttraj.\$ext.pdb pdb append" >> $1/MD/generate_pdb_total.x
		echo "		go" >> $1/MD/generate_pdb_total.x
		echo "EOF" >> $1/MD/generate_pdb_total.x
		echo "" >> $1/MD/generate_pdb_total.x
	done
	echo "	rm gdt-total_Ttraj.\$ext.dat  " >> $1/MD/generate_pdb_total.x
	echo "	rm gdt-total_Ttraj.\$ext.dat2 " >> $1/MD/generate_pdb_total.x
	echo "	clusco_cpu -t remd_total_Ttraj.\$ext.pdb -s gdt -e ../LEAP/$reference_file  -o gdt-total_Ttraj.\$ext.dat" >> $1/MD/generate_pdb_total.x
	echo "	sed s/\"         0     \"//g gdt-total_Ttraj.\$ext.dat > gdt-total_Ttraj.\$ext.dat2 " >> $1/MD/generate_pdb_total.x
	echo "	mv gdt-total_Ttraj.\$ext.dat2 gdt-total_Ttraj.\$ext.dat" >> $1/MD/generate_pdb_total.x
	echo "done                       " >> $1/MD/generate_pdb_total.x
else
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		#echo "$mdinfile" >> $1/MD/generate_pdb_total.x
		echo "		rm $mdinfile.Ttraj.\$ext.pdb" >> $1/MD/generate_pdb_total.x
		echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/generate_pdb_total.x
		echo "		trajin $mdinfile.ncdf.\$ext " >> $1/MD/generate_pdb_total.x
		echo "		parm \$2 " >> $1/MD/generate_pdb_total.x
		echo "		reference \$2 parm \$2 [pdb-file] " >> $1/MD/generate_pdb_total.x
		echo "		trajout remd_total.\$ext.pdb pdb append" >> $1/MD/generate_pdb_total.x
		echo "		go" >> $1/MD/generate_pdb_total.x
		echo "EOF" >> $1/MD/generate_pdb_total.x
		echo "" >> $1/MD/generate_pdb_total.x
	done
	echo "	rm gdt-total_Ttraj.\$ext.dat  " >> $1/MD/generate_pdb_total.x
	echo "	rm gdt-total_Ttraj.\$ext.dat2 " >> $1/MD/generate_pdb_total.x
	echo "	clusco_cpu -t remd_total.\$ext.pdb -s gdt -e ../LEAP/$reference_file -o gdt-total.\$ext.dat" >> $1/MD/generate_pdb_total.x
	echo "	sed s/\"         0     \"//g gdt-total.\$ext.dat > gdt-total.\$ext.dat2 " >> $1/MD/generate_pdb_total.x
	echo "	mv gdt-total.\$ext.dat2 gdt-total.\$ext.dat" >> $1/MD/generate_pdb_total.x
	echo "done                       " >> $1/MD/generate_pdb_total.x
fi	

echo "                           " >> $1/MD/generate_pdb_total.x
echo "echo \" PDBs total trajectories generated! \" " >> $1/MD/generate_pdb_total.x

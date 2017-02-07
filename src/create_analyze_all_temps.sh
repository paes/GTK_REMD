#!/bin/bash


nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/analyze_all_temps.x
echo "####This script is responsible of demultiplexing remd outputs. It will pick every generated .ncdf.REPLICA and return .ncdf.TEMPERATURE trajectories." >> $1/MD/analyze_all_temps.x

echo "nrep=\`wc temperatures.dat | awk '{print \$2}'\` #where $1/$2 is the temperature.dat complete path" >> $1/MD/analyze_all_temps.x
echo "for T in \`cat temperatures.dat\` ; do" >> $1/MD/analyze_all_temps.x

for mdinfile in $1/MD/*.mdin ; do
	mdinfile=$(basename $mdinfile)
	mdinfile=`echo $mdinfile | cut -d . -f 1`
	#echo "$mdinfile" >> $1/MD/analyze_all_temps.x
	echo "		rm $mdinfile.Ttraj.\$T" >> $1/MD/analyze_all_temps.x
	echo "		  cpptraj \$1.prmtop <<EOF" >> $1/MD/analyze_all_temps.x
	echo "		trajin $mdinfile.ncdf.001 remdtraj remdtrajtemp \$T" >> $1/MD/analyze_all_temps.x
	echo "		trajout $mdinfile.Ttraj.\$T ncdf" >> $1/MD/analyze_all_temps.x
	echo "		go" >> $1/MD/analyze_all_temps.x
	echo "EOF" >> $1/MD/analyze_all_temps.x
	echo "" >> $1/MD/analyze_all_temps.x
done
echo "done                       " >> $1/MD/analyze_all_temps.x


echo "                           " >> $1/MD/analyze_all_temps.x
echo "echo \" Analyze All Temps (Demultiplexation) Completed! \" " >> $1/MD/analyze_all_temps.x


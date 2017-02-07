#!/bin/bash


nrep=`wc $1/MD/$2 | awk '{print $2}'` #where $1/$2 is the temperature.dat complete path

echo "#!/bin/bash -f" > $1/MD/compute_energies.x
echo "####This script is responsible of generating Potential Energy trajectories" >> $1/MD/compute_energies.x






simulation_type=$3
#echo "$simulation_type"
if [ "$simulation_type" -lt "2" ] 
then
	echo "REMD Simulation"
	cp -R ../src/EnergyDistribution $1/MD/EnergyDistribution
	echo "cd $1/MD/EnergyDistribution" >> $1/MD/compute_energies.x
	echo "python energydistribution.py 0" >> $1/MD/compute_energies.x
else
	echo "MD Simulation" 
	echo "count=0" >> $1/MD/compute_energies.x
	echo "for ext in \`cat temperatures.dat\`" >> $1/MD/compute_energies.x
	echo "do                                " >> $1/MD/compute_energies.x
	echo "  let COUNT+=1                    " >> $1/MD/compute_energies.x
	echo "  REP=\`printf \"%03d\" \$COUNT\`      " >> $1/MD/compute_energies.x
	echo "  rm -f energy_\$ext.temp" >> $1/MD/compute_energies.x
	for mdinfile in $1/MD/*.mdin ; do
		mdinfile=$(basename $mdinfile)
		mdinfile=`echo $mdinfile | cut -d . -f 1`
		
		echo "  grep \"EPtot\" $mdinfile.mdout.\$ext | awk -F' ' '{ print \$9 }' | head -n -2 >> energy_\$ext.temp " >> $1/MD/compute_energies.x
		done
	echo "  python compute_energies.py energy_\$ext.temp \$ext energy_\$ext.xvg" >> $1/MD/compute_energies.x		
	echo "  rm -f energy_\$ext.temp"  >> $1/MD/compute_energies.x
	echo "done                       " >> $1/MD/compute_energies.x
fi


echo "                           " >> $1/MD/compute_energies.x
echo "echo \" Energies from total trajectories calculated! \" " >> $1/MD/compute_energies.x

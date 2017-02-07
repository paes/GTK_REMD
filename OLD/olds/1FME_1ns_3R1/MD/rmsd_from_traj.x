#!/bin/bash -f
nrep=`wc temperatures.dat | awk '{print $2}'` #where /media/lipinski/345fad8a-4774-4a42-9ee1-cb2ba5a0d23b/Dropbox/gtk_remd/1FME_1ns_3R1/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
	rm radgyr-total_Ttraj.$ext.dat
		  cpptraj $1.prmtop <<EOF
		trajin remd_total.$ext.pdb 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		rms remd_total.$ext.pdb ref [pdb-file] : 3-33@CA :3-33@CA out rmsd-total_Ttraj_3-33.CA.$ext.dat
		radgyr out radgyr_Ttraj.$ext.dat
EOF

done                       
                           
echo " RMSDs and/or RADGYR from total trajectories generated! " 

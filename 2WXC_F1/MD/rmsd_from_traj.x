#!/bin/bash -f
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/2WXC_D1/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
	rm radgyr-total_Ttraj.$ext.dat
		  cpptraj $1.prmtop <<EOF
		trajin remd_00*.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		rms remd_00*.Ttraj.$ext ref [pdb-file] :10-28,36-470@CA :133-151,159-170@CA out rmsd-total_Ttraj.$ext.dat
		radgyr out radgyr_Ttraj.$ext.dat
EOF

done                       
                           
echo " RMSDs and/or RADGYR from total trajectories generated! " 

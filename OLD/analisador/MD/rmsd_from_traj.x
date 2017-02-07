#!/bin/bash -f
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/analisador/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
		  cpptraj $1.prmtop <<EOF
		trajin remd_total_Ttraj.$ext.pdb 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		rms remd_total_Ttraj.$ext.pdb ref [pdb-file] : 1-28@CA :1-28@CA out rmsd-total_Ttraj_1-28.CA.$ext.dat
EOF

done                       
                           
echo " RMSDs and/or RADGYR from total trajectories generated! " 

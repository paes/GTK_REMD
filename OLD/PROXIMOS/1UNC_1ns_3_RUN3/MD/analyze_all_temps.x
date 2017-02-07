#!/bin/bash -f
####This script is responsible of demultiplexing remd outputs. It will pick every generated .ncdf.REPLICA and return .ncdf.TEMPERATURE trajectories.
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1unc_133/temperatures.dat is the temperature.dat complete path
for T in `cat temperatures.dat` ; do
		rm remd_001.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001.Ttraj.$T
		go
EOF

		rm remd_002.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_002.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_002.Ttraj.$T
		go
EOF

		rm remd_003.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_003.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_003.Ttraj.$T
		go
EOF

		rm remd_004.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_004.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_004.Ttraj.$T
		go
EOF

		rm remd_005.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_005.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_005.Ttraj.$T
		go
EOF

		rm remd_006.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_006.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_006.Ttraj.$T
		go
EOF

done                       
                           
echo " Analyze All Temps (Demultiplexation) Completed! " 

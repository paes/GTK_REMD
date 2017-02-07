#!/bin/bash -f
####This script is responsible of demultiplexing remd outputs. It will pick every generated .ncdf.REPLICA and return .ncdf.TEMPERATURE trajectories.
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1FME_2ns_1R1/temperatures.dat is the temperature.dat complete path
for T in `cat temperatures.dat` ; do
		rm remd_001_small_001.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_001.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_001.Ttraj.$T
		go
EOF

		rm remd_001_small_002.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_002.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_002.Ttraj.$T
		go
EOF

		rm remd_001_small_003.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_003.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_003.Ttraj.$T
		go
EOF

		rm remd_001_small_004.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_004.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_004.Ttraj.$T
		go
EOF

		rm remd_001_small_005.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_005.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_005.Ttraj.$T
		go
EOF

		rm remd_001_small_006.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_006.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_006.Ttraj.$T
		go
EOF

		rm remd_001_small_007.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_007.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_007.Ttraj.$T
		go
EOF

		rm remd_001_small_008.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_008.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_008.Ttraj.$T
		go
EOF

		rm remd_001_small_009.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_009.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_009.Ttraj.$T
		go
EOF

		rm remd_001_small_010.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_010.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_010.Ttraj.$T
		go
EOF

		rm remd_001_small_011.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_011.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_011.Ttraj.$T
		go
EOF

		rm remd_001_small_012.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_012.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_012.Ttraj.$T
		go
EOF

		rm remd_001_small_013.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_013.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_013.Ttraj.$T
		go
EOF

		rm remd_001_small_014.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_014.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_014.Ttraj.$T
		go
EOF

		rm remd_001_small_015.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_015.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_015.Ttraj.$T
		go
EOF

		rm remd_001_small_016.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_016.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_016.Ttraj.$T
		go
EOF

		rm remd_001_small_017.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_017.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_017.Ttraj.$T
		go
EOF

		rm remd_001_small_018.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_018.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_018.Ttraj.$T
		go
EOF

		rm remd_001_small_019.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_019.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_019.Ttraj.$T
		go
EOF

		rm remd_001_small_020.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_020.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_020.Ttraj.$T
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

#!/bin/bash -f
####This script is responsible of generating pdb trajectories from ncdf(binary) files. PDB format is common entry for analysis programs.
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1unc_124/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
		rm remd_001.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_002.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_002.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_003.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_003.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_004.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_004.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_005.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_005.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_006.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_006.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

done                       
                           
echo " PDBs total trajectories generated! " 

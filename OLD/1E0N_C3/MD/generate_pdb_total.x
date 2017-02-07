#!/bin/bash -f
####This script is responsible of generating pdb trajectories from ncdf(binary) files. PDB format is common entry for analysis programs.
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1E0N_C3/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
		rm remd_001_small_001.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_001.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_002.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_002.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_003.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_003.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_004.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_004.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_005.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_005.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_006.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_006.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_007.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_007.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_008.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_008.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_009.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_009.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_010.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_010.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_011.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_011.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_012.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_012.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_013.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_013.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_014.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_014.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_015.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_015.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_016.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_016.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_017.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_017.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_018.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_018.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_019.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_019.Ttraj.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total_Ttraj.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_020.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_020.Ttraj.$ext 
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

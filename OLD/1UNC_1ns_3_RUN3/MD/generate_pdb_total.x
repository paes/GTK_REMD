#!/bin/bash -f
####This script is responsible of generating pdb trajectories from ncdf(binary) files. PDB format is common entry for analysis programs.
nrep=`wc temperatures.dat | awk '{print $2}'` #where /home/lipinski/Dropbox/gtk_remd/1UNC_1ns_3_RUN3/temperatures.dat is the temperature.dat complete path
for ext in `cat temperatures.dat` ; do
		rm remd_001_small_001.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_001.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_002.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_002.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_003.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_003.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_004.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_004.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_005.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_005.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_006.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_006.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_007.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_007.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_008.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_008.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_009.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_009.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_010.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_010.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_011.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_011.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_012.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_012.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_013.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_013.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_014.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_014.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_015.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_015.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_016.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_016.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_017.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_017.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_018.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_018.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_019.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_019.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_001_small_020.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_020.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_002.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_002.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_003.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_003.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_004.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_004.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_005.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_005.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

		rm remd_006.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_006.ncdf.$ext 
		parm $2 
		reference $2 parm $2 [pdb-file] 
		trajout remd_total.$ext.pdb pdb append
		go
EOF

done                       
                           
echo " PDBs total trajectories generated! " 

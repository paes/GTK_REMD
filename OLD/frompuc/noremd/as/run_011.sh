mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_001.011 -i remd_001.mdin.011 -c mini_000.rst -r remd_001.rst.011 -x remd_001.ncdf.011 -inf remd_001.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_001.mdout.011
mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_002.011 -i remd_002.mdin.011 -c remd_001.rst.011 -r remd_002.rst.011 -x remd_002.ncdf.011 -inf remd_002.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_002.mdout.011
mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_003.011 -i remd_003.mdin.011 -c remd_002.rst.011 -r remd_003.rst.011 -x remd_003.ncdf.011 -inf remd_003.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_003.mdout.011
mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_004.011 -i remd_004.mdin.011 -c remd_003.rst.011 -r remd_004.rst.011 -x remd_004.ncdf.011 -inf remd_004.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_004.mdout.011
mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_005.011 -i remd_005.mdin.011 -c remd_004.rst.011 -r remd_005.rst.011 -x remd_005.ncdf.011 -inf remd_005.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_005.mdout.011
mpirun -np 5 -machinefile machinefile /usr/local/Amber/amber14/bin/pmemd.MPI -O -l log_007.011 -i remd_006.mdin.011 -c remd_005.rst.011 -r remd_006.rst.011 -x remd_006.ncdf.011 -inf remd_006.mdinfo.011 -p ../LEAP/job_id.prmtop -o remd_006.mdout.011
python set_end.py 011
python verify_end.py

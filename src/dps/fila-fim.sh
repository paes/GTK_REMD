chmod 777 *.x
chmod 777 *.sh


 
cat rem_001*.log > rem_total.log
python EF.py > En_fun_001.txt

cat rem_001*.log rem_002.log  > rem_total.log
python EF.py > En_fun_002.txt

cat rem_001*.log rem_002.log rem_003.log  > rem_total.log
python EF.py > En_fun_003.txt

cat rem_001*.log rem_002.log rem_003.log rem_004.log  > rem_total.log
python EF.py > En_fun_004.txt

cat rem_001*.log rem_002.log rem_003.log rem_004.log rem_005.log  > rem_total.log
python EF.py > En_fun_005.txt

cat rem_001*.log rem_002.log rem_003.log rem_004.log rem_005.log rem_006.log > rem_total.log
python EF.py > En_fun_006.txt

cat En_fun_001.txt En_fun_002.txt En_fun_003.txt En_fun_004.txt En_fun_005.txt En_fun_006.txt > En_fun_total.txt

chmod 777 *.x
analyze_all_temps.x job_id ../1UNC01-Hs.pdb 
generate_pdb_total_002toobig.x job_id ../1UNC01-Hs.pdb 
rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 1 35
rmsd-from-Ttraj.x job_id ../1UNC01-Hs.pdb 3 33
gdt-from-Ttraj.x
radgyr-from-Ttraj.x job_id

#!/bin/bash -f
### DEVE SER CHAMADO NO DIRETORIO ANTERIOR ao diretorio principal, onde principal = 1UNC_1ns_1_RUN1!
# create_plot2.x RUN_NUMBER(SEED-1,2,3etc) TYPE_OF_SIMULATION(CT-REMD,REMD.CMD,MD)
#ex: create_plot2.x 1 1 2 3 4  


mkdir plots
cd plots

compute_quarts.py dados5.quart.dat ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.269.50.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.355.26.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.461.67.dat ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.285.22.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.374.74.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.485.87.dat ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.301.66.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.395.07.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.511.14.dat ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.318.76.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.416.32.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.537.54.dat ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.336.61.dat  ../1UNC_1ns_$2_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.438.50.dat

compute_quarts.py dados6.quart.dat ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.269.50.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.355.26.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.461.67.dat ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.285.22.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.374.74.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.485.87.dat ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.301.66.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.395.07.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.511.14.dat ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.318.76.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.416.32.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.537.54.dat ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.336.61.dat  ../1UNC_1ns_$3_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.438.50.dat

compute_quarts.py dados7.quart.dat ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.001.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.006.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.011.dat ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.002.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.007.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.012.dat ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.003.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.008.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.013.dat ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.004.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.009.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.014.dat ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.005.dat  ../1UNC_1ns_$4_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.010.dat

compute_quarts.py dados8.quart.dat ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.001.dat  ../1UNC_1ns_$5_RUN1/MD/rmsd-total_Ttraj_3-33_CA.006.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.011.dat ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.002.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.007.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.012.dat ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.003.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.008.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.013.dat ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.004.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.009.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.014.dat ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.005.dat  ../1UNC_1ns_$5_RUN$1/MD/rmsd-total_Ttraj_3-33_CA.010.dat

paste dados5.quart.dat dados6.quart.dat dados7.quart.dat dados8.quart.dat > data-q.rmsd.dat
candles.sh
mv bar3.pdf rmsd-quart.pdf



compute_quarts_gdt.py gdt5.quart.dat ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.269.50.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.355.26.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.461.67.dat ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.285.22.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.374.74.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.485.87.dat ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.301.66.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.395.07.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.511.14.dat ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.318.76.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.416.32.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.537.54.dat ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.336.61.dat  ../1UNC_1ns_$2_RUN$1/MD/gdt-total_Ttraj.438.50.dat

compute_quarts_gdt.py gdt6.quart.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.269.50.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.355.26.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.461.67.dat ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.285.22.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.374.74.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.485.87.dat ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.301.66.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.395.07.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.511.14.dat ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.318.76.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.416.32.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.537.54.dat ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.336.61.dat  ../1UNC_1ns_$3_RUN$1/MD/gdt-total_Ttraj.438.50.dat

compute_quarts_gdt.py gdt7.quart.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.001.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.006.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.011.dat ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.002.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.007.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.012.dat ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.003.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.008.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.013.dat ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.004.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.009.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.014.dat ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.005.dat  ../1UNC_1ns_$4_RUN$1/MD/gdt-total_Ttraj.010.dat

compute_quarts_gdt.py gdt8.quart.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.001.dat  ../1UNC_1ns_$5_RUN1/MD/gdt-total_Ttraj.006.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.011.dat ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.002.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.007.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.012.dat ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.003.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.008.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.013.dat ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.004.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.009.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.014.dat ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.005.dat  ../1UNC_1ns_$5_RUN$1/MD/gdt-total_Ttraj.010.dat

paste gdt5.quart.dat gdt6.quart.dat gdt7.quart.dat gdt8.quart.dat > data-q.gdt.dat
candles_gdt.sh
mv bar3.pdf gdt-quart.pdf


mkdir plots_$1
mv  gdt5.quart.dat gdt6.quart.dat gdt7.quart.dat gdt8.quart.dat data-q.gdt.dat gdt-quart.pdf dados5.quart.dat dados6.quart.dat dados7.quart.dat dados8.quart.dat data-q.rmsd.dat rmsd-quart.pdf plots_$1/ 
cd '..'





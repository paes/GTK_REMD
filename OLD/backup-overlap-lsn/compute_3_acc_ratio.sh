#!/bin/bash
#FIRST SCRIPT TO BE CALLED
#bash compute_3_acc_ratio.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN3 R1R2R3_t_ACCRATIO 1000 45000

#inputs:
# $1 -> primeira pasta
# $2 -> segunda pasta
# $3 -> terceira pasta
# $4 -> pasta de saída
# $5 -> numero de exchanges Cut-offs baixos
# $6 -> numero de exchanges Cut-off final
#



#bash compute_3_acc_ratio.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3  R1R2R3_t_ACCRATIO 1000 45000

#bash compute_3_acc_ratio.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6/ R4R5R6_ct_ACCRATIO 1000 1000


#bash compute_3_acc_ratio.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3  R1R2R3_t_ACCRATIO 1000 45000


#ATENCAO NUMEXCHANGES##
#bash compute_3_acc_ratio.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/
1ns/OK/02-REMD/1UNC_1ns_2_RUN4/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6_ERRORI R4R5R6_t_ACCRATIO 1000 45000

#bash compute_3_acc_ratio.sh /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN3  R1R2R3_2ns_ct_ACCRATIO 1000 45000

#bash compute_3_acc_ratio.sh /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN4 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN5 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_1_R6_new R4R5R6_2ns_ct_ACCRATIO 1000 1000


bash compute_acc_ratio.sh $1 $5 $6 $4 1
bash compute_acc_ratio.sh $2 $5 $6 $4 2
echo "bash compute_acc_ratio.sh $3 $5 $6 $4 3" > teste
bash compute_acc_ratio.sh $3 $5 $6 $4 3

cd $4

echo "paste 1/ACC_final.dat  2/ACC_final.dat   3/ACC_final.dat > ACC_final_123.dat"
paste 1/ACC_final.dat  2/ACC_final.dat   3/ACC_final.dat > ACC_final_123.dat


python compute_acc_avg.py 

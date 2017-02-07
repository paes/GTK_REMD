#!/bin/bash
#FIRST SCRIPT TO BE CALLED

#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3/ R1R2R3_t_ACCRATIO 

#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6_ERRORI R4R5R6_t_ACCRATIO

#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6_ERRORI R4R5R6_t_ACCRATIO


###### FUNCIONARAM #########
#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN1/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3/ R1R2R3_ct_ACCRATIO  


#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6/ R4R5R6_ct_ACCRATIO 1000 1000


#bash compute_4_ETR.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3  R1R2R3_t_ACCRATIO 1000 45000


############################
#inputs:
# $1 -> primeira pasta
# $2 -> segunda pasta
# $3 -> terceira pasta
# $4 -> pasta de saída
#

mkdir $4
cd $4
mkdir ETR
PATH=`pwd`
cd ..

cd $1/MD
#pwd
/bin/cp /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/ETR.py ETR.py
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_001
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_002
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_003
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_004
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_005
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_006
/usr/bin/paste remd_00*_ETR.out > ETR_total.out
/bin/cp ETR_total.out $PATH/ETR/ETR_total_R1.out
#/bin/cp ETR_total.out /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R4R5R6_t_ACCRATIO/ETR/ETR_total_R1.out

cd $2/MD
/bin/cp /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/ETR.py ETR.py
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_001
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_002
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_003
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_004
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_005
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_006
/usr/bin/paste remd_00*_ETR.out > ETR_total.out
/bin/cp ETR_total.out $PATH/ETR/ETR_total_R2.out

cd $3/MD
/bin/cp /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/ETR.py ETR.py
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_001
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_002
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_003
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_004
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_005
/home/lipinski/programs/anaconda2/bin/python ETR.py remd_006
/usr/bin/paste remd_00*_ETR.out > ETR_total.out
/bin/cp ETR_total.out $PATH/ETR/ETR_total_R3.out

cd $PATH
echo "estou aqui"
/bin/ls -lrth
pwd
cd ETR
echo "paste ETR_total_R1.out ETR_total_R2.out ETR_total_R3.out > ETR_final_123.dat"
/usr/bin/paste ETR_total_R1.out ETR_total_R2.out ETR_total_R3.out > ETR_final_123.dat

/bin/cp /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/compute_etr_avg.py .
/home/lipinski/programs/anaconda2/bin/python compute_etr_avg.py 

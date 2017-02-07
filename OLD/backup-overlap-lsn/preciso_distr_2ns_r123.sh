#!/bin/bash

#$1 sao os mdouts que servem de entrada
#e $2 o tamanho da janela


TRUE=`pwd`



cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN1/MD/EnergyDistribution/
# antigo 1UNC_1ns_1_RUN1/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	 #ACHAR ESSE CARA
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir $TRUE/R1R2R3_distr_vs_2ns
#mkdir ../../../../R1R2R3_distr_vs_2ns #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp $TRUE/group_energies.py $TRUE/R1R2R3_distr_vs_2ns/group_energies.py
#cp ../../../../verify_distribution.py ../../../../R1R2R3_distr_vs_2ns/verify_distribution.py
cp ../../temperatures.dat $TRUE/R1R2R3_distr_vs_2ns/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_269.5_1.dat 
      tail -n +13 dist-energy_285.22.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_285.22_1.dat 
      tail -n +13 dist-energy_301.66.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_301.66_1.dat 
      tail -n +13 dist-energy_318.76.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_318.76_1.dat 
      tail -n +13 dist-energy_336.61.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_336.61_1.dat 
      tail -n +13 dist-energy_355.26.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_355.26_1.dat 
      tail -n +13 dist-energy_374.74.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_374.74_1.dat 
      tail -n +13 dist-energy_395.07.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_395.07_1.dat 
      tail -n +13 dist-energy_416.32.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_416.32_1.dat 
      tail -n +13 dist-energy_438.5.xvg  >  $TRUE/R1R2R3_distr_vs_2ns/dist_438.5_1.dat 
      tail -n +13 dist-energy_461.67.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_461.67_1.dat 
      tail -n +13 dist-energy_485.87.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_485.87_1.dat 
      tail -n +13 dist-energy_511.14.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_511.14_1.dat 
      tail -n +13 dist-energy_537.54.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_537.54_1.dat 


#cd $TRUE/1UNC_1ns_1_RUN2/MD/EnergyDistribution/
cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/


      tail -n +13 dist-energy_269.5.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_269.5_2.dat 
      tail -n +13 dist-energy_285.22.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_285.22_2.dat 
      tail -n +13 dist-energy_301.66.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_301.66_2.dat 
      tail -n +13 dist-energy_318.76.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_318.76_2.dat 
      tail -n +13 dist-energy_336.61.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_336.61_2.dat 
      tail -n +13 dist-energy_355.26.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_355.26_2.dat 
      tail -n +13 dist-energy_374.74.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_374.74_2.dat 
      tail -n +13 dist-energy_395.07.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_395.07_2.dat 
      tail -n +13 dist-energy_416.32.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_416.32_2.dat 
      tail -n +13 dist-energy_438.5.xvg  >  $TRUE/R1R2R3_distr_vs_2ns/dist_438.5_2.dat 
      tail -n +13 dist-energy_461.67.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_461.67_2.dat 
      tail -n +13 dist-energy_485.87.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_485.87_2.dat 
      tail -n +13 dist-energy_511.14.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_511.14_2.dat 
      tail -n +13 dist-energy_537.54.xvg >  $TRUE/R1R2R3_distr_vs_2ns/dist_537.54_2.dat 

#cd $TRUE/1UNC_1ns_1_RUN3/MD/EnergyDistribution/
cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN3/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

      tail -n +13 dist-energy_269.5.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_269.5_3.dat 
      tail -n +13 dist-energy_285.22.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_285.22_3.dat 
      tail -n +13 dist-energy_301.66.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_301.66_3.dat 
      tail -n +13 dist-energy_318.76.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_318.76_3.dat 
      tail -n +13 dist-energy_336.61.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_336.61_3.dat 
      tail -n +13 dist-energy_355.26.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_355.26_3.dat 
      tail -n +13 dist-energy_374.74.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_374.74_3.dat 
      tail -n +13 dist-energy_395.07.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_395.07_3.dat 
      tail -n +13 dist-energy_416.32.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_416.32_3.dat 
      tail -n +13 dist-energy_438.5.xvg  >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_438.5_3.dat 
      tail -n +13 dist-energy_461.67.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_461.67_3.dat 
      tail -n +13 dist-energy_485.87.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_485.87_3.dat 
      tail -n +13 dist-energy_511.14.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_511.14_3.dat 
      tail -n +13 dist-energy_537.54.xvg >  $TRUE/../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_537.54_3.dat 

cd $TRUE/R1R2R3_distr_vs_2ns/
cp ../verify_distribution.sh .
cp ../verify_errors.sh .
#só roda o de baixo, que executa pelos 2 - bash verify_distribution.sh $1 $2 $3 $4 $5 $6 



echo "finalizando para ct-remd ..."
pwd






## aqui tenho que ir para o REMD!
pwd
cd "$TRUE"
echo $TRUE
pwd
cd ../02-REMD/1UNC_1ns_2_RUN1/MD/EnergyDistribution/

echo "me movi para ca:"
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir ../../../../R1R2R3_distr_vs_2ns #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../R1R2R3_distr_vs_2ns/group_energies.py
#cp ../../../../verify_distribution.py ../../../../R1R2R3_distr_vs_2ns/verify_distribution.py
cp ../../temperatures.dat ../../../../R1R2R3_distr_vs_2ns/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_269.5_1_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_285.22_1_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_301.66_1_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_318.76_1_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_336.61_1_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_355.26_1_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_374.74_1_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_395.07_1_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_416.32_1_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_438.5_1_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_461.67_1_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_485.87_1_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_511.14_1_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_537.54_1_remd.dat 


cd ../../../../1UNC_1ns_2_RUN2/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/


      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_269.5_2_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_285.22_2_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_301.66_2_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_318.76_2_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_336.61_2_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_355.26_2_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_374.74_2_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_395.07_2_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_416.32_2_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_438.5_2_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_461.67_2_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_485.87_2_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_511.14_2_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_537.54_2_remd.dat 

cd ../../../../1UNC_1ns_2_RUN3/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_269.5_3_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_285.22_3_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_301.66_3_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_318.76_3_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_336.61_3_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_355.26_3_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_374.74_3_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_395.07_3_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_416.32_3_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_438.5_3_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_461.67_3_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_485.87_3_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_511.14_3_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/dist_537.54_3_remd.dat 
pwd
cd ../../../../../01-CT-REMD/R1R2R3_distr_vs_2ns/
cp ../verify_distribution.sh .
cp ../verify_errors.sh .
bash verify_distribution.sh $1 $2 $3 $4 $5 $6 
bash verify_errors.sh $1 $2

echo "finalizando para remd ..."
pwd


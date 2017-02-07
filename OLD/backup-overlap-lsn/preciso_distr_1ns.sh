#!/bin/bash

#$1 sao os mdouts que servem de entrada
#e $2 o tamanho da janela

cd 1UNC_1ns_1_RUN1/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir ../../../../R1R2R3_distr #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../R1R2R3_distr/group_energies.py
#cp ../../../../verify_distribution.py ../../../../R1R2R3_distr/verify_distribution.py
cp ../../temperatures.dat ../../../../R1R2R3_distr/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  ../../../../R1R2R3_distr/dist_269.5_1.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../R1R2R3_distr/dist_285.22_1.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../R1R2R3_distr/dist_301.66_1.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../R1R2R3_distr/dist_318.76_1.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../R1R2R3_distr/dist_336.61_1.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../R1R2R3_distr/dist_355.26_1.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../R1R2R3_distr/dist_374.74_1.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../R1R2R3_distr/dist_395.07_1.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../R1R2R3_distr/dist_416.32_1.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../R1R2R3_distr/dist_438.5_1.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../R1R2R3_distr/dist_461.67_1.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../R1R2R3_distr/dist_485.87_1.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../R1R2R3_distr/dist_511.14_1.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../R1R2R3_distr/dist_537.54_1.dat 


cd ../../../../1UNC_1ns_1_RUN2/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/


      tail -n +13 dist-energy_269.5.xvg >  ../../../../R1R2R3_distr/dist_269.5_2.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../R1R2R3_distr/dist_285.22_2.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../R1R2R3_distr/dist_301.66_2.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../R1R2R3_distr/dist_318.76_2.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../R1R2R3_distr/dist_336.61_2.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../R1R2R3_distr/dist_355.26_2.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../R1R2R3_distr/dist_374.74_2.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../R1R2R3_distr/dist_395.07_2.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../R1R2R3_distr/dist_416.32_2.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../R1R2R3_distr/dist_438.5_2.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../R1R2R3_distr/dist_461.67_2.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../R1R2R3_distr/dist_485.87_2.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../R1R2R3_distr/dist_511.14_2.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../R1R2R3_distr/dist_537.54_2.dat 

cd ../../../../1UNC_1ns_1_RUN3/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_269.5_3.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_285.22_3.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_301.66_3.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_318.76_3.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_336.61_3.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_355.26_3.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_374.74_3.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_395.07_3.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_416.32_3.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_438.5_3.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_461.67_3.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_485.87_3.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_511.14_3.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_537.54_3.dat 

cd ../../../../R1R2R3_distr/
cp ../verify_distribution.sh .
cp ../verify_errors.sh .
#só roda o de baixo, que executa pelos 2 - bash verify_distribution.sh $1 $2 $3 $4 $5 $6 



echo "finalizando para ct-remd ..."
pwd










cd ../../02-REMD/1UNC_1ns_2_RUN1/MD/EnergyDistribution/

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

mkdir ../../../../R1R2R3_distr #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../R1R2R3_distr/group_energies.py
#cp ../../../../verify_distribution.py ../../../../R1R2R3_distr/verify_distribution.py
cp ../../temperatures.dat ../../../../R1R2R3_distr/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_269.5_1_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_285.22_1_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_301.66_1_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_318.76_1_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_336.61_1_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_355.26_1_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_374.74_1_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_395.07_1_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_416.32_1_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_438.5_1_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_461.67_1_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_485.87_1_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_511.14_1_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_537.54_1_remd.dat 


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


      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_269.5_2_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_285.22_2_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_301.66_2_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_318.76_2_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_336.61_2_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_355.26_2_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_374.74_2_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_395.07_2_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_416.32_2_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_438.5_2_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_461.67_2_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_485.87_2_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_511.14_2_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_537.54_2_remd.dat 

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

      tail -n +13 dist-energy_269.5.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_269.5_3_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_285.22_3_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_301.66_3_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_318.76_3_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_336.61_3_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_355.26_3_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_374.74_3_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_395.07_3_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_416.32_3_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_438.5_3_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_461.67_3_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_485.87_3_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_511.14_3_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ../../../../../01-CT-REMD/R1R2R3_distr/dist_537.54_3_remd.dat 
pwd
cd ../../../../../01-CT-REMD/R1R2R3_distr/
cp ../verify_distribution.sh .
cp ../verify_errors.sh .
bash verify_distribution.sh $1 $2 $3 $4 $5 $6 
bash verify_errors.sh $1 $2

echo "finalizando para remd ..."
pwd


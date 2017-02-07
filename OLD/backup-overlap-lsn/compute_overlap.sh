#!/bin/bash

########   # local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
########   # usando $1 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
#######    # $4 -> padrao de tamanho de janela.
########   # $5 -> identificador

#output="ps"
#output="png"
output="pdf"

if [ "$output" == "ps" ]
then
	term="postscript enhanced color dashed font \"Times-Roman, 13\""	
	#term="postscript enhanced color dashed font \"Times-Roman, 14\""	
	#term="postscript enhanced color dashed "
	#term="postscript enhanced color dashed font \"Times-Roman, 24\""
	output_extension="ps"
elif [ "$output" == "pdf" ]
then
	term="pdf enhanced color dashed font \"Times-Roman, 13\""	
	output_extension="pdf"
else
	term="pngcairo color dashed font \"Times-Roman,13\""
	#term="pngcairo color dashed font \"Times-Roman,14\""
	#term="pngcairo color dashed font \"FreeSans,9\""
	output_extension="png"
fi

gnuplot=/usr/bin/gnuplot
#gnuplot=/usr/local/Cellar/gnuplot/5.0.1/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'
     
      #local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
      #$1 caminho até lá (antes de MD)
      # aqui temos a string para busca dos mdouts que formarão o P(E) setada em remd_00
      
cd $1/MD/EnergyDistribution/
echo "1 - copiando para energy distribution"
cp /home/lipinski/Dropbox/gtk_remd/src/EnergyDistribution/energydistribution.* .
echo "1 - copiando o .bkp"
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5 #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/group_energies.py /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/group_energies.py
cp ../../temperatures.dat /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/temperatures.dat

#cat ../../temperatures.dat | while read TEMP
#do
#	echo "$TEMP"
#done

sed s/"\.10"/"\.1"/ ../../temperatures.dat > temperatures-no50.dat
sed -i s/"\.20"/"\.2"/ temperatures-no50.dat 
sed -i s/"\.30"/"\.3"/ temperatures-no50.dat 
sed -i s/"\.40"/"\.4"/ temperatures-no50.dat 
sed -i s/"\.50"/"\.5"/ temperatures-no50.dat 
sed -i s/"\.60"/"\.6"/ temperatures-no50.dat 
sed -i s/"\.70"/"\.7"/ temperatures-no50.dat 
sed -i s/"\.80"/"\.8"/ temperatures-no50.dat 
sed -i s/"\.90"/"\.9"/ temperatures-no50.dat 

#for TEMP in 'cat ../../temperatures.dat'
###echo "um"

#pwd
#cat temperatures-no50.dat 
cat temperatures-no50.dat | while read TEMP  
do
	#echo " $TEMP"
    #echo "dist-energy_$TEMP.xvg"
    tail -n +13 "dist-energy_$TEMP.xvg" > /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/dist_${TEMP}_1.dat #>  ../../../../R1R2R3_$5/dist_$TEMP_1.dat 
done

cp temperatures-no50.dat ../../../../$2/MD/EnergyDistribution/output/temperatures-no50.dat
echo  "pwd3"
pwd
cd  ../../../../$2/MD/EnergyDistribution/
echo "pwd 3"
pwd
echo "2 - copiando para energy distribution"
cp /home/lipinski/Dropbox/gtk_remd/src/EnergyDistribution/energydistribution.* .
echo "2 - copiando o .bkp"
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
python energydistribution.py 0
cd output/


###echo "dois"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
    tail -n +13 "dist-energy_$TEMP.xvg" > /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/dist_${TEMP}_2.dat 
done

cp temperatures-no50.dat $3/MD/EnergyDistribution/output/temperatures-no50.dat
echo  "pwd3"
pwd
cd  $3/MD/EnergyDistribution/
echo "pwd 3"
pwd
echo "3 - copiando para energy distribution"
cp /home/lipinski/Dropbox/gtk_remd/src/EnergyDistribution/energydistribution.* .
echo "3 - copiando o .bkp"
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
python energydistribution.py 0
cd output/

###echo "tres"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
      tail -n +13 "dist-energy_$TEMP.xvg" > /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/dist_${TEMP}_3.dat 
done

cp temperatures-no50.dat  /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/temperatures-no50.dat
cd /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/R1R2R3_$5/
rm overlap_R1R2.dat overlap_R1R3.dat overlap_R2R3.dat

###echo "quatro"
#for TEMP in 'cat temperatures.dat'     
cat temperatures-no50.dat | while read TEMP
do
#echo "$TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP " 
python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_2.dat $4 dist_${TEMP}_R1R2.dat >> overlap_R1R2.dat
#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_2.dat $4 dist_${TEMP}_R1R2.dat"
#echo "--"

#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_3.dat $4 dist_${TEMP}_R1R3.dat "
python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_3.dat $4 dist_${TEMP}_R1R3.dat >> overlap_R1R3.dat
#echo "python group_energies.py dist_${TEMP}_2.dat dist_${TEMP}_3.dat $4 dist_${TEMP}_R2R3.dat "
python group_energies.py dist_${TEMP}_2.dat dist_${TEMP}_3.dat $4 dist_${TEMP}_R2R3.dat >> overlap_R2R3.dat
done      

###echo "cinco"    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste






#rodando, teste:

# bash compute_overlap.sh /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN1/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3/ 10 R1R2R3_teste

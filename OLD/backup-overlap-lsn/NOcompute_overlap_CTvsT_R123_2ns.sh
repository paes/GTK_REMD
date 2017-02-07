#!/bin/bash

########   # local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
########   # usando $1 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
#######    # $2 -> padrao de tamanho de janela.
########   # $3 -> mesma coisa que $1 mas para outro tipo de simulacao 1UNC_1ns_2

# bash compute_overlap.sh 1UNC_1ns_1 10 1UNC_2ns_1

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




TRUE=`pwd`


      
      #local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
      #usando $1 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
      # aqui temos a string para busca dos mdouts que formarão o P(E) setada em remd_00
cd $1_RUN1/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config #por padrao faz para todos .mdout (todos cutoffs)
python energydistribution.py 0
cd output/





mkdir $TRUE/R1R2R3_ct_vs_t_2ns #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py $TRUE/R1R2R3_ct_vs_t_2ns/group_energies.py
cp ../../temperatures.dat $TRUE/R1R2R3_ct_vs_t_2ns/temperatures.dat



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
    tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_${TEMP}_4.dat #>  ../../../../../R1R2R3_ct_vs_t_2ns/dist_$TEMP_1.dat 
done

cp temperatures-no50.dat ../../../../$1_RUN2/MD/EnergyDistribution/output/temperatures-no50.dat
cd ../../../../$1_RUN2/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
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
    tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_${TEMP}_5.dat 
done

cp temperatures-no50.dat ../../../../$1_RUN3/MD/EnergyDistribution/output/temperatures-no50.dat
cd ../../../../$1_RUN3/MD/EnergyDistribution/
cp ../../../energydistribution.config.bkp .	
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
      tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_${TEMP}_6.dat 
done

cp temperatures-no50.dat $TRUE/R1R2R3_ct_vs_t_2ns/temperatures-no50.dat

###############finalizei o que precisava do CT-REMD











#### AQUI EU ENTRO QUANDO CHEGA A HORA DE CALCULAR... MAS SE VOU PRECISAR DE OUTRO TIPO DE SIMULACAO< AINDA N POSSO ENTRAR



#cd $1_RUN1/MD/EnergyDistribution/output #isso morre depois do teste
#cd ../../../../../02-REMD/
#cd $3_RUN1/MD/EnergyDistribution/
cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN1/MD/EnergyDistribution/

cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
python energydistribution.py 0
cd output/






mkdir $TRUE/R1R2R3_ct_vs_t_2ns #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp $TRUE/group_energies.py $TRUE/R1R2R3_ct_vs_t_2ns/group_energies.py
cp ../../temperatures.dat $TRUE/R1R2R3_ct_vs_t_2ns/temperatures.dat



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
    tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_remd_${TEMP}_4.dat #>  ../../../../../R1R2R3_ct_vs_t_2ns/dist_$TEMP_1.dat 
done



#cp temperatures-no50.dat ../../../../$3_RUN2/MD/EnergyDistribution/output/temperatures-no50.dat
#cd ../../../../$3_RUN2/MD/EnergyDistribution/
cp temperatures-no50.dat /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2/MD/EnergyDistribution/output/temperatures-no50.dat

cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2/MD/EnergyDistribution/

cp $TRUE/energydistribution.config.bkp .	
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
    tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_remd_${TEMP}_5.dat 
done

cp temperatures-no50.dat /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN3/MD/EnergyDistribution/output/temperatures-no50.dat

cd /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2/MD/EnergyDistribution/

cp $TRUE/energydistribution.config.bkp .

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
      tail -n +13 "dist-energy_$TEMP.xvg" > $TRUE/R1R2R3_ct_vs_t_2ns/dist_remd_${TEMP}_6.dat 
done

cp temperatures-no50.dat $TRUE/R1R2R3_ct_vs_t_2ns/temperatures-no50.dat


############################## AGORA SIM, ESTOU EM OUTPUT (do ultimo) DE NOVO E VOU ENTRRAR NA PASTA QUE TEM O QUE GEREI ATE AGORA
cd $TRUE/R1R2R3_ct_vs_t_2ns/
rm overlap_R1vsR1.dat overlap_R2vsR2.dat overlap_R3vsR3.dat

###echo "quatro"
#for TEMP in 'cat temperatures.dat'     
cat temperatures-no50.dat | while read TEMP
do
#echo "$TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP " 
python group_energies.py dist_${TEMP}_4.dat dist_remd_${TEMP}_4.dat $2 dist_${TEMP}_R4vsR4.dat >> overlap_R1vsR1.dat
#isso por enquanto nao eh possivel pois nao tenho _remd_4 gerado, nem 5 nem 6, so os que nao sao remd  (sao ctremd) thiago, 22marco
#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_2.dat $2 dist_${TEMP}_R4R5.dat"
#echo "--"



#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_3.dat $2 dist_${TEMP}_R4R6.dat "
python group_energies.py dist_${TEMP}_5.dat dist_remd_${TEMP}_5.dat $2 dist_${TEMP}_R5vsR5.dat >> overlap_R2vsR2.dat
#echo "python group_energies.py dist_${TEMP}_2.dat dist_${TEMP}_3.dat $2 dist_${TEMP}_R5R6.dat "
python group_energies.py dist_${TEMP}_6.dat dist_remd_${TEMP}_6.dat $2 dist_${TEMP}_R6vsR6.dat >> overlap_R3vsR3.dat

done      

###echo "cinco"    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste

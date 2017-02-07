#!/bin/bash

########   # local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
########   # usando $1 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
#######    # $2 -> padrao de tamanho de janela.
########


#  bash compute_overlap_CTvsT_R456_2ns.sh 1UNC_1ns_1 10 1UNC_1ns_2 1ns
# 1UNC_1ns_2 = T_REMD (sempre 1ns)
# vs 1UNC_1ns_1 =  CT (nesse caso 1ns)

#  bash compute_overlap_CTvsT_R456_2ns.sh 1UNC_2ns_1 10 1UNC_1ns_2 1ns
# 1UNC_1ns_2 = T_REMD (sempre 1ns)
# vs 1UNC_2ns_1 =  CT (nesse caso 2ns)


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
      #usando $1 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
      # aqui temos a string para busca dos mdouts que formarão o P(E) setada em remd_00
cd $1_RUN4/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config #por padrao faz para todos .mdout (todos cutoffs)
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/



mkdir ../../../../../R4R5R6_ct_vs_t_${4} #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../../R4R5R6_ct_vs_t_${4}/group_energies.py
cp ../../temperatures.dat ../../../../../R4R5R6_ct_vs_t_${4}/temperatures.dat



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
    tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_${TEMP}_4.dat #>  ../../../../../R4R5R6_ct_vs_t_${4}/dist_$TEMP_1.dat 
done

echo "to aqui"
pwd
cp temperatures-no50.dat ../../../../$1_RUN5/MD/EnergyDistribution/output/temperatures-no50.dat
cd ../../../../$1_RUN5/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/




###echo "dois"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
    tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_${TEMP}_5.dat 
done

cp temperatures-no50.dat ../../../../$1_RUN6/MD/EnergyDistribution/output/temperatures-no50.dat
cd ../../../../$1_RUN6/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/

###echo "tres"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
      tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_${TEMP}_6.dat 
done

cp temperatures-no50.dat ../../../../../R4R5R6_ct_vs_t_${4}/temperatures-no50.dat

###############finalizei o que precisava do CT-REMD


# AQUI EU ENTRO QUANDO CHEGA A HORA DE CALCULAR... MAS SE VOU PRECISAR DE OUTRO TIPO DE SIMULACAO< AINDA N POSSO ENTRAR

cd ../../../../../02-REMD/

cd $3_RUN4/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/




mkdir ../../../../../R4R5R6_ct_vs_t_${4} #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../../R4R5R6_ct_vs_t_${4}/group_energies.py
cp ../../temperatures.dat ../../../../../R4R5R6_ct_vs_t_${4}/temperatures.dat



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
    tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_remd_${TEMP}_4.dat #>  ../../../../../R4R5R6_ct_vs_t_${4}/dist_$TEMP_1.dat 
done

cp temperatures-no50.dat ../../../../$3_RUN5/MD/EnergyDistribution/output/temperatures-no50.dat
echo "to aqui"
pwd

cd ../../../../$3_RUN5/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/




###echo "dois"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
    tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_remd_${TEMP}_5.dat 
done

cp temperatures-no50.dat ../../../../$3_RUN6/MD/EnergyDistribution/output/temperatures-no50.dat
cd ../../../../$3_RUN6/MD/EnergyDistribution/
pwd
cp ../../../energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"remd_00"/ energydistribution.config
pwd
echo "python energydistr.."
#python energydistribution.py 0
cd output/

###echo "tres"
#for TEMP in 'cat ../../temperatures.dat'
cat temperatures-no50.dat | while read TEMP
do
      tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R4R5R6_ct_vs_t_${4}/dist_remd_${TEMP}_6.dat 
done

cp temperatures-no50.dat ../../../../../R4R5R6_ct_vs_t_${4}/temperatures-no50.dat


############################## AGORA SIM, ESTOU EM OUTPUT (do ultimo) DE NOVO E VOU ENTRRAR NA PASTA QUE TEM O QUE GEREI ATE AGORA
cd ../../../../../R4R5R6_ct_vs_t_${4}/
rm overlap_R4vsR4.dat overlap_R5vsR5.dat overlap_R6vsR6.dat

###echo "quatro"
#for TEMP in 'cat temperatures.dat'     
cat temperatures-no50.dat | while read TEMP
do
#echo "$TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP $TEMP " 
python group_energies.py dist_${TEMP}_4.dat dist_remd_${TEMP}_4.dat $2 dist_${TEMP}_R4vsR4.dat >> overlap_R4vsR4.dat
#isso por enquanto nao eh possivel pois nao tenho _remd_4 gerado, nem 5 nem 6, so os que nao sao remd  (sao ctremd) thiago, 22marco
#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_2.dat $2 dist_${TEMP}_R4R5.dat"
#echo "--"



#echo "python group_energies.py dist_${TEMP}_1.dat dist_${TEMP}_3.dat $2 dist_${TEMP}_R4R6.dat "
python group_energies.py dist_${TEMP}_5.dat dist_remd_${TEMP}_5.dat $2 dist_${TEMP}_R5vsR5.dat >> overlap_R5vsR5.dat
#echo "python group_energies.py dist_${TEMP}_2.dat dist_${TEMP}_3.dat $2 dist_${TEMP}_R5R6.dat "
python group_energies.py dist_${TEMP}_6.dat dist_remd_${TEMP}_6.dat $2 dist_${TEMP}_R6vsR6.dat >> overlap_R6vsR6.dat

done      

###echo "cinco"    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste

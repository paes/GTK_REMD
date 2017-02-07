#!/bin/bash




TRUE=`pwd`

cd $1/MD/ #isso morre depois do teste
pwd

mkdir $TRUE/$4 #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
mkdir $TRUE/$4/$5 #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)


#cp temperatures.dat /../../../R1R2R3_ct_vs_t_TESTE_ACCRATIO/temperatures.dat

#cat ../../temperatures.dat | while read TEMP
#do
#	echo "$TEMP"
#done

pwd


cat temperatures.dat > temps1.dat
tail -n +2 temperatures.dat > temps2.dat

#sed s/"\.10"/"\.1"/ temperatures.dat > temperatures-no50.dat
#sed -i s/"\.20"/"\.2"/ temperatures-no50.dat 
#sed -i s/"\.30"/"\.3"/ temperatures-no50.dat 
#sed -i s/"\.40"/"\.4"/ temperatures-no50.dat 
#sed -i s/"\.50"/"\.5"/ temperatures-no50.dat 
#sed -i s/"\.60"/"\.6"/ temperatures-no50.dat 
#sed -i s/"\.70"/"\.7"/ temperatures-no50.dat 
#sed -i s/"\.80"/"\.8"/ temperatures-no50.dat 
#sed -i s/"\.90"/"\.9"/ temperatures-no50.dat 





for co in 001 002 003 004 005 006 ; do
#for co in 005 ; do
rm saida_acc_ratio_$co.dat teste teste2  teste_temps
cat temps1.dat | while read TEMP  
	do
		low_temp="$TEMP"
		#echo "$low_temp"
		read TEMP
		#echo "$TEMP"
		#echo "$TEMP"
		echo "$low_temp $TEMP" >> teste_temps
		#echo "$low_temp $TEMP" #>> teste_temps
		#pwd
		#ls *.log -lrth
		cat rem*_$co*.log | grep "$low_temp    $TEMP" | wc | awk '{print $1}' >> "teste"
		paste teste_temps teste > teste_saida.dat
		#head -n -0 teste_saida.dat > saida_acc_ratio_$co.dat
		mv teste_saida.dat  saida_acc_ratio_$co.dat
		cat saida_acc_ratio_$co.dat
		#echo " $TEMP"
		#echo "dist-energy_$TEMP.xvg"
		#tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R1R2R3_ct_vs_t_TESTE_ACCRATIO/dist_remd_${TEMP}_4.dat #>  ../../../../../R1R2R3_ct_vs_t_TESTE_ACCRATIO/dist_$TEMP_1.dat 
	done
done
for co in 001 002 003 004 005 006 ; do
#for co in 005 ; do
rm saida_acc_ratio2_$co.dat teste teste2  teste_temps
cat temps2.dat | while read TEMP  
	do
		low_temp="$TEMP"
		#echo "$low_temp"
		read TEMP
		#echo "$TEMP"
		#echo "$TEMP"
		echo "$low_temp $TEMP" >> teste_temps
		#echo "$low_temp $TEMP" #>> teste_temps
		cat rem*_$co*.log | grep "$low_temp    $TEMP" | wc | awk '{print $1}' >> "teste"
		pwd
		paste teste_temps teste > teste_saida.dat
		head -n -1 teste_saida.dat > saida_acc_ratio2_$co.dat
		#mv teste_saida.dat saida_acc_ratio2_$co.dat
		#echo " $TEMP"
		#echo "dist-energy_$TEMP.xvg"
		#tail -n +13 "dist-energy_$TEMP.xvg" > ../../../../../R1R2R3_ct_vs_t_TESTE_ACCRATIO/dist_remd_${TEMP}_4.dat #>  ../../../../../R1R2R3_ct_vs_t_TESTE_ACCRATIO/dist_$TEMP_1.dat 
	done
	cat saida_acc_ratio_$co.dat saida_acc_ratio2_$co.dat > ACC_$co2.dat
	sort -i -k1 ACC_$co2.dat > ACC_$co.dat
	rm ACC_$co2.dat
	
	cp $TRUE/compute_acc.py .
	cp $TRUE/compute_acc_avg.py $TRUE/$4/compute_acc_avg.py
	if [ "$co" = "006" ]
	then
    echo "python compute_acc.py ACC_$co.dat $3"
    python compute_acc.py ACC_$co.dat $3
	paste ACC_$co.dat ACC_${co}_results.dat > ACC_${co}_final.dat
	cp ACC_${co}_final.dat $TRUE/$4/$5
	
	else
    echo "python compute_acc.py ACC_$co.dat $2"
    python compute_acc.py ACC_$co.dat $2
	paste ACC_$co.dat ACC_${co}_results.dat > ACC_${co}_final.dat
	cp ACC_${co}_final.dat $TRUE/$4/$5
	fi

done

awk '{print $1}' ACC_006.dat > temperaturas1.dat
awk '{print $2}' ACC_006.dat > temperaturas2.dat

paste temperaturas1.dat temperaturas2.dat ACC_001_results.dat ACC_002_results.dat ACC_003_results.dat ACC_004_results.dat ACC_005_results.dat ACC_006_results.dat >  $TRUE/$4/$5/ACC_final.dat




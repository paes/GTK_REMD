#!/bin/bash


# bash verify_distribution.sh remd_002 1 -500 0 -4 4 
# 
# ANTES DE RODAR ESSE SCRIPT, PRECISO RODAR O "PRECISO_DISTR_1NS" OU "PRECISO_DISTR_1NS_456" - POIS ESTES GERAM AS DISTRIBUICOES
# QUANDO A RODAR verify_distribution.sh, tenho algumas entradas:
# $1 -> remd_002 é utilizado para diferenciar resultados de diferentes cut-offs
# $2 -> janela de kcal.
#  X0 do gráfico
#  X1 do gráfico
#  Y0 do grafico
#  Y1 do gráfico


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

    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste
# O QUE IMPORTA EH A SAIDA QUE ESSE GROUP_ENERGIES GERA.
python group_energies.py dist_269.5_1.dat  dist_285.22_1.dat $2 dist_269.5_1_285.22_1.$1.window$2.dat 
python group_energies.py dist_285.22_1.dat dist_301.66_1.dat $2 dist_285.22_1_301.66_1.$1.window$2.dat 
python group_energies.py dist_301.66_1.dat dist_318.76_1.dat $2 dist_301.66_1_318.76_1.$1.window$2.dat 
python group_energies.py dist_318.76_1.dat dist_336.61_1.dat $2 dist_318.76_1_336.61_1.$1.window$2.dat 
python group_energies.py dist_336.61_1.dat dist_355.26_1.dat $2 dist_336.61_1_355.26_1.$1.window$2.dat 
python group_energies.py dist_355.26_1.dat dist_374.74_1.dat $2 dist_355.26_1_374.74_1.$1.window$2.dat 
python group_energies.py dist_374.74_1.dat dist_395.07_1.dat $2 dist_374.74_1_395.07_1.$1.window$2.dat 
python group_energies.py dist_395.07_1.dat dist_416.32_1.dat $2 dist_395.07_1_416.32_1.$1.window$2.dat 
python group_energies.py dist_416.32_1.dat dist_438.5_1.dat  $2 dist_416.32_1_438.5_1.$1.window$2.dat  
python group_energies.py dist_438.5_1.dat  dist_461.67_1.dat $2 dist_438.5_1_461.67_1.$1.window$2.dat  
python group_energies.py dist_461.67_1.dat dist_485.87_1.dat $2 dist_461.67_1_485.87_1.$1.window$2.dat 
python group_energies.py dist_485.87_1.dat dist_511.14_1.dat $2 dist_485.87_1_511.14_1.$1.window$2.dat 
python group_energies.py dist_511.14_1.dat dist_537.54_1.dat $2 dist_511.14_1_537.54_1.$1.window$2.dat 
                                                              
python group_energies.py dist_269.5_2.dat  dist_285.22_2.dat $2 dist_269.5_2_285.22_2.$1.window$2.dat 
python group_energies.py dist_285.22_2.dat dist_301.66_2.dat $2 dist_285.22_2_301.66_2.$1.window$2.dat 
python group_energies.py dist_301.66_2.dat dist_318.76_2.dat $2 dist_301.66_2_318.76_2.$1.window$2.dat 
python group_energies.py dist_318.76_2.dat dist_336.61_2.dat $2 dist_318.76_2_336.61_2.$1.window$2.dat 
python group_energies.py dist_336.61_2.dat dist_355.26_2.dat $2 dist_336.61_2_355.26_2.$1.window$2.dat 
python group_energies.py dist_355.26_2.dat dist_374.74_2.dat $2 dist_355.26_2_374.74_2.$1.window$2.dat 
python group_energies.py dist_374.74_2.dat dist_395.07_2.dat $2 dist_374.74_2_395.07_2.$1.window$2.dat 
python group_energies.py dist_395.07_2.dat dist_416.32_2.dat $2 dist_395.07_2_416.32_2.$1.window$2.dat 
python group_energies.py dist_416.32_2.dat dist_438.5_2.dat  $2 dist_416.32_2_438.5_2.$1.window$2.dat  
python group_energies.py dist_438.5_2.dat  dist_461.67_2.dat $2 dist_438.5_2_461.67_2.$1.window$2.dat  
python group_energies.py dist_461.67_2.dat dist_485.87_2.dat $2 dist_461.67_2_485.87_2.$1.window$2.dat 
python group_energies.py dist_485.87_2.dat dist_511.14_2.dat $2 dist_485.87_2_511.14_2.$1.window$2.dat 
python group_energies.py dist_511.14_2.dat dist_537.54_2.dat $2 dist_511.14_2_537.54_2.$1.window$2.dat 
                                                              
python group_energies.py dist_269.5_3.dat  dist_285.22_3.dat $2 dist_269.5_3_285.22_3.$1.window$2.dat 
python group_energies.py dist_285.22_3.dat dist_301.66_3.dat $2 dist_285.22_3_301.66_3.$1.window$2.dat 
python group_energies.py dist_301.66_3.dat dist_318.76_3.dat $2 dist_301.66_3_318.76_3.$1.window$2.dat 
python group_energies.py dist_318.76_3.dat dist_336.61_3.dat $2 dist_318.76_3_336.61_3.$1.window$2.dat 
python group_energies.py dist_336.61_3.dat dist_355.26_3.dat $2 dist_336.61_3_355.26_3.$1.window$2.dat 
python group_energies.py dist_355.26_3.dat dist_374.74_3.dat $2 dist_355.26_3_374.74_3.$1.window$2.dat 
python group_energies.py dist_374.74_3.dat dist_395.07_3.dat $2 dist_374.74_3_395.07_3.$1.window$2.dat 
python group_energies.py dist_395.07_3.dat dist_416.32_3.dat $2 dist_395.07_3_416.32_3.$1.window$2.dat 
python group_energies.py dist_416.32_3.dat dist_438.5_3.dat  $2 dist_416.32_3_438.5_3.$1.window$2.dat  
python group_energies.py dist_438.5_3.dat  dist_461.67_3.dat $2 dist_438.5_3_461.67_3.$1.window$2.dat  
python group_energies.py dist_461.67_3.dat dist_485.87_3.dat $2 dist_461.67_3_485.87_3.$1.window$2.dat 
python group_energies.py dist_485.87_3.dat dist_511.14_3.dat $2 dist_485.87_3_511.14_3.$1.window$2.dat 
python group_energies.py dist_511.14_3.dat dist_537.54_3.dat $2 dist_511.14_3_537.54_3.$1.window$2.dat 
      


 
sed -e "1d" temperatures.dat > temperatures2.dat
paste temperatures.dat temperatures2.dat > filelist.dat
sed -i '$ d' filelist.dat
sed -i s/"	     "/"_1_"/ filelist.dat
sed -i s/"     "/""/ filelist.dat
sed -i -e 's/^/dist_/' filelist.dat
sed -e 's/$/'_1.$1.window$2.dat'/' -i filelist.dat
cp filelist.dat filelist2.dat
cp filelist.dat filelist1.dat
cp filelist.dat filelist3.dat
sed -i s/"_1"/"_2"/ filelist2.dat
sed -i s/"_1"/"_2"/ filelist2.dat
sed -i s/"_1"/"_3"/ filelist3.dat
sed -i s/"_1"/"_3"/ filelist3.dat
cat filelist1.dat filelist2.dat filelist3.dat > filelist.dat
filelist1=`cat filelist1.dat`
filelist2=`cat filelist2.dat`
filelist3=`cat filelist3.dat`
rm temperatures2.dat
sed -i s/".10_"/".1_"/ filelist*.dat
sed -i s/".20_"/".2_"/ filelist*.dat
sed -i s/".30_"/".3_"/ filelist*.dat
sed -i s/".40_"/".4_"/ filelist*.dat
sed -i s/".50_"/".5_"/ filelist*.dat
sed -i s/".60_"/".6_"/ filelist*.dat
sed -i s/".70_"/".7_"/ filelist*.dat
sed -i s/".80_"/".8_"/ filelist*.dat
sed -i s/".90_"/".9_"/ filelist*.dat

nrep=`wc temperatures.dat | awk '{print $2}'`


echo | $gnuplot <<EOF
 
   
set term ${term}


#SOBRE O GRID
# Line style for axes
set style line 90 lt 1 lc 3
set style line 90 lt rgb "#808080"
# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#808080"  # grey

set grid back linestyle 81

set border 3 linestyle 90 
	     # Remove border on top and right.  These
             # borders are useless and make it harder
             # to see plotted lines near the border.
 	     # Also, put it in grey; no need for so much emphasis on a border.
 	     
 	     
 	     

# set terminal png transparent nocrop enhanced size 450,320 font "arial,8" 
set output "./ln_$1_win$2.${output_extension}"


####set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

####set xrange [ $ : 29 ] noreverse nowriteback
set xrange [ $3 : $4 ]
####set yrange [ 0 :] noreverse nowriteback
set yrange [ $5 : $6 ] #noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Potential Energy (kcal/mol)"
set ylabel "ln [P(E,T2)/P(E,T1)] "

#legenda
#set key horizontal center bottom outside maxrows 1
#set key samplen 2 spacing .5 font ",8"
unset key

# Give the plot a title
#set title "ln [P(E,T2)/P(E,T1)] "

set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orange"
set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "yellow"
set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "green"
set style line 5 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "seagreen"
set style line 6 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "cyan"
set style line 7 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
set style line 8 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "violet"
set style line 9 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "magenta"
set style line 10 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "gold"
set style line 11 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orchid"
set style line 12 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "black"
set style line 13 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#FF69B4


set style line 14 lt 1 lw 1 pt 1  	 ps 0.25 linecolor rgb 	"red"
set style line 15 lt 1 lw 1 pt 7  	 ps 0.25 linecolor rgb  "orange"
set style line 16 lt 122 lw 1 pt 122 ps 0.25 linecolor rgb  "yellow"
set style line 17 lt 2 lw 1 pt 2   	 ps 0.25 linecolor rgb  "green"
set style line 18 lt 146 lw 1 pt 146 ps 0.25 linecolor rgb  "seagreen"
set style line 19 lt 37 lw 1 pt 37   ps 0.35 linecolor rgb  "cyan"
set style line 20 lt 70 lw 1 pt 142  ps 0.25 linecolor rgb  "blue"
set style line 21 lt 1   lw 1 pt 13  ps 0.25 linecolor rgb  "violet"
set style line 22 lt 64 lw 1 pt 4  ps 0.25 linecolor rgb    "magenta"
set style line 23 lt 71 lw 1 pt 71  ps 0.25 linecolor rgb    "gold"
set style line 24 lt 75 lw 1 pt 75  ps 0.35 linecolor rgb    "orchid"
set style line 25 lt 71 lw 1 pt 9  ps 0.35 linecolor rgb   "black"
set style line 26 lt 71 lw 1 pt 73  ps 0.35 linecolor rgb    "#FF69B4


# 1 - cruz
# 7 - bola
# 122 - quadrado completo
# 2 - x
#146 - asterisco
# 37 - triangulo para baixo
#142 diamante vazado
#13 diamante 
# 4 quadrado vazado
#9 - triangulo para cima
#75 - vazado triangulo pra baixo
#71 - bola vazada
#73 - vazado triangulo pra cima



###color "black" 
###color "black" 
###color "black" 
###color "black" 
###color "black" 
###color "black"  #"black"  122
###color "black" #"black"   154
###color "black"  #"black"  143
###color "black"  #"black"  37 
###color "black"  #"black
###color "black" 
###color black" 
###color "black" 


## A relevant knowledge on the ANOVA. 
##	SST = SSR+SSE
##
## where, each term represents following items.
### Total sum of squares, SST: the total variation in the observed values of the reponse variable.
### Regression sum of squares, SSR: the variation in the observed values of the response variable explained by the regression
## Error sum of squares, SSE: the variation in the observed values of the response variable not explained by the regression.
## Also, the coefficient of determination, r^2 is 
##  R^2 = SSR/SST

##	The tricky part is to obtain SST using the fit command, which is a curve fitting, but produces some useful variables, FIT_WSSR and FIT_NDF. For details, refer to gnuplot tricks: Basic statistics.

set fit errorvariables
	mean(x)= me
	fit mean(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
	#print m_err
	#print y0_err

	#set label sprintf("f1(x)=%fx+%f\nR^2=%f", m, y0, R2) # print r^2.

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)
	



####http://core.ecu.edu/psyc/wuenschk/docs30/CompareCorrCoeff.pdf
###sb1b2 = sqrt( (m_err * m_err) + (0*0) )
###erro_slope = (m - ideal_slope ) /  sb1b2 
###print "Erro Slope : ", erro_slope
###
###erro_slope2 = (ideal_slope - m) /  sb1b2 
###print "Erro Slope : ", erro_slope2





#f2(x) = m2*x + y1
#	fit f2(x) 'dist_269.5_1_285.22_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via m2,y1


#m2 = m2 + 0.01
#m2 = ideal_slope
#print m2




#sb1b2 = sqrt( (m_err * m_err) + (m2_err * m2_err) )
#erro_slope = (m - m2 ) /  sb1b2 
#print "Erro Slope : ", erro_slope




#f3(x) = ideal_slope*x + y2
#	fit f3(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y2


mean2(x)= me2
	fit mean2(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
	#print m_err
	#print y0_err


	





print "me do mean(x): ", me

print "R2 da distribuicao para com a reta mais proxima dela: ", R2 # r2 ou coeficiente de determinacao
print "m(coeficiente angular) dessa reta: ",m # coeficiente angular
print "m_err: ", m_err #standard error for slope
print "Ideal Slope: ",ideal_slope

# gerar agora o R2 da minha distribuicao em relacao ao slope correto.

print "me do mean2(x): ", me2
print "R2 da distribuicao para com a reta ideal: ", R2_ideal # r2 ou coeficiente de determinacao
print "m(coeficiente angular) dessa reta: ",me # coeficiente angular
print "m_err: ", me_err #standard error for slope
print "Ideal Slope: ",ideal_slope


print "Error against ideal slope: ", ( (R2 / R2_ideal) - 1 ) * 100,  "%"  
#ACIMA EU CONSIGO CALCULAR O ERRO DE QLQR DISTRIBUICAO CONTRA O IDEAL_SLOPE.
#PARA CALCULAR O ERRO ENTRE REMD e CT REMD, PRECISAREI SOMENTE DOS SLOPES (SLOPE CT, SLOPE REMD e SLOPE IDEAL) -> 


	
ideal_slope4 = ideal_slope + 0.10
f4(x) = ideal_slope4*x + y4
fit f4(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y4

ideal_slope5 = ideal_slope + 0.20
f5(x) = ideal_slope5*x + y5
fit f5(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y5

ideal_slope6 = ideal_slope +  0.30
f6(x) = ideal_slope6*x + y6
fit f6(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y6


ideal_slope7 = ideal_slope +  0.40
f7(x) = ideal_slope7*x + y7
fit f7(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y7

ideal_slope8 = ideal_slope +  0.50
f8(x) = ideal_slope8*x + y8
fit f8(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y8

ideal_slope9 = ideal_slope + 0.60
f9(x) = ideal_slope9*x + y9
fit f9(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y9


plot f1(x),	'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 15  lw 2 title "374-395" ,\
	 f3(x) ls 20 ,\
	 f4(x) ls 21 ,\
	 f5(x) ls 22 ,\
	 f6(x) ls 23 ,\
	 f7(x) ls 20 ,\
	 #f8(x) ls 21 ,\ 
	 #f9(x) ls 22 ,\
                
ideal_slope4 = ideal_slope + 0.010
f4(x) = ideal_slope4*x + y4
fit f4(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y4

ideal_slope5 = ideal_slope + 0.020
f5(x) = ideal_slope5*x + y5
fit f5(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y5

ideal_slope6 = ideal_slope + 0.030
f6(x) = ideal_slope6*x + y6
fit f6(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y6


ideal_slope7 = ideal_slope + 0.040
f7(x) = ideal_slope7*x + y7
fit f7(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y7



plot f1(x),	'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 15  lw 2 title "374-395" ,\
	 f3(x) ls 20 ,\
	 f4(x) ls 21 ,\
	 f5(x) ls 22 ,\
	 f6(x) ls 23 ,\
	 f7(x) ls 20 ,\


set title "1ns - R1"

#ideal slope = ideal_slope + 0.10
#replot f3(x) ls 20 ;


list1 = system('cat filelist1.dat')
list2 = system('cat filelist2.dat')
list3 = system('cat filelist3.dat')

i = 14

#do for [file in list1] {
#	print file
#    plot file using (\$1):(log(\$3 / \$2)) with points ls 15  lw 2 title "374-395" ,\
#    i = i + 1
#}


item(n) = word(list1,n)
item(n) = word(list2,n)
item(n) = word(list3,n)


system('rm erros_against_idealslope.dat') 
do for [a=1:14] {

	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)
	#ideal_slope = m - 0.10 
#	update teste.txt

#	set fit noerrorvariables
	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"



#print "media da distribuicao = mean(x) = mean2(x): ", me

####print "R2 da distribuicao para com a reta mais proxima dela: ", R2 # r2 ou coeficiente de determinacao
####print "m(coeficiente angular) dessa reta: ",m # coeficiente angular
####print "m_err: ", m_err #standard error for slope
####
####
##### gerar agora o R2 da minha distribuicao em relacao ao slope correto.
####
#####print "me do mean2(x): ", me2
####print "R2 da distribuicao para com a reta ideal: ", R2_ideal # r2 ou coeficiente de determinacao
####print "Ideal Slope: ",ideal_slope
####print "m_err: ", me_err #standard error for slope



#print "Error against ideal slope for temp ", a , " is: " , ( (1 - R2 / 1 - R2_ideal) ) ,  "%"  
#print "Error against ideal slope for ", a , " is: " , ( (R2) - (R2_ideal) )/ (R2_ideal) ,  "%"  

# quando o ideal slope for maior:


#print (ideal_slope)
#print (m)
set angles degrees
print atan(ideal_slope)
print atan(m)
set angles radians
#print atan(ideal_slope)
#print atan(m)
delta = abs(m - ideal_slope )
####print delta
error = delta / ideal_slope
error = error * 100


delta2 = abs(R2 - R2_ideal)
error2 = delta2 / R2_ideal 
error2 = error2 * 100
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
#print "Relative Slope Error against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error ,  "%" 
#print "Relative R² Error against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error2 ,  "%" 



error3 = delta / m_err
#print "Z Error against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error3 ,  "%" 
 

if (m > ideal_slope) {
	error4 = m / ideal_slope 
	error4 = (error4 - 1 ) * 100
}
else{
	error4 = m / ideal_slope 
	error4 = (1 - error4) * 100
}
	

#print "Ratio m against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error4 ,  "%"
error5 = R2 / R2_ideal
#print "Ratio R2 against ideal R2 slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error5 ,  "%"



error6 = delta

#print "Delta Slope from  m against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error6
#print "Delta Slope% from  m against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error6*100 ,  "%"



set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

m_angle = atan(m)
ideal_angle = atan(ideal_slope)


if (m_angle > ideal_angle) {
	error4 = m_angle / ideal_angle 
	
	error4 = (error4 - 1 ) * 100
}
else{
	error4 = m_angle / ideal_angle 
	error4 = (1 - error4) * 100
}
#print "Ratio m_angle against ideal slope_angle for adjacent temperatures ", (a-1) , " and " , a  ," is: " , error4 ,  "%"


set print "erros_against_idealslope.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"



}




plot for [a=1:14] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

plot for [a=1:14] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

plot for [a=1:14] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

 
#lot 'dist_269.5_1_285.22_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 14 title "269-285" ,\
#	'dist_285.22_1_301.66_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 15  title "285-301" ,\
#	'dist_301.66_1_318.76_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 16  title "301-318",\
#	'dist_318.76_1_336.61_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 17  title "318-336",\
#	'dist_336.61_1_355.26_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 18  title "336-355",\
#	'dist_355.26_1_374.74_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 19  title "355-374",\
#	'dist_374.74_1_395.07_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 20  title "374-395",\
#	'dist_395.07_1_416.32_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 21  title "395-416",\
#	'dist_416.32_1_438.5_1.$1.window$2.dat'   using (\$1):(log(\$3 / \$2)) with points ls 22  title "416-438" ,\
#	'dist_438.5_1_461.67_1.$1.window$2.dat'  using (\$1):(log(\$3 / \$2)) with points ls 23  title "438-461",\
#	'dist_461.67_1_485.87_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 24  title "461-485",\
#	'dist_485.87_1_511.14_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 25  title "485-511",\
#	'dist_511.14_1_537.54_1.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls 26  title "511-537";
#
#et title "45ns - R2"
#lot 'dist_269.5_2_285.22_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  14 title "269-285" ,\
#	'dist_285.22_2_301.66_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  15 title "285-301" ,\
#	'dist_301.66_2_318.76_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  16 title "301-318",\
#	'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  17 title "318-336",\
#	'dist_336.61_2_355.26_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  18 title "336-355",\
#	'dist_355.26_2_374.74_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  19 title "355-374",\
#	'dist_374.74_2_395.07_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  20 title "374-395",\
#	'dist_395.07_2_416.32_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  21 title "395-416",\
#	'dist_416.32_2_438.5_2.$1.window$2.dat'  using (\$1):(log(\$3 / \$2)) with points ls  22 title "416-438" ,\
#	'dist_438.5_2_461.67_2.$1.window$2.dat'  using (\$1):(log(\$3 / \$2)) with points ls  23 title "438-461",\
#	'dist_461.67_2_485.87_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  24 title "461-485",\
#	'dist_485.87_2_511.14_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  25 title "485-511",\
#	'dist_511.14_2_537.54_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  26 title "511-537";
#
#et title "45ns - R3"
#lot 'dist_269.5_3_285.22_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  14  title "269-285" ,\
#	'dist_285.22_3_301.66_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  15  title "285-301" ,\
#	'dist_301.66_3_318.76_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  16  title "301-318",\
#	'dist_318.76_3_336.61_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  17  title "318-336",\
#	'dist_336.61_3_355.26_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  18  title "336-355",\
#	'dist_355.26_3_374.74_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  19  title "355-374",\
#	'dist_374.74_3_395.07_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  20  title "374-395",\
#	'dist_395.07_3_416.32_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  21  title "395-416",\
#	'dist_416.32_3_438.5_3.$1.window$2.dat'  using (\$1):(log(\$3 / \$2)) with points ls  22  title "416-438" ,\
#	'dist_438.5_3_461.67_3.$1.window$2.dat'  using (\$1):(log(\$3 / \$2)) with points ls  23  title "438-461",\
#	'dist_461.67_3_485.87_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  24  title "461-485",\
#	'dist_485.87_3_511.14_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  25  title "485-511",\
#	'dist_511.14_3_537.54_3.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) with points ls  26  title "511-537";
#

EOF

# plot "../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj.269.50.dat" using (1-0.45):2 ls 1 with boxplot title "CTREMD" ,\
#   "269.50" 1 ,     v2 
#   "285.22" 3 ,     v3 
#   "301.66" 5 ,     v4 
#   "318.76" 7 ,     v5 
#   "336.61" 9 ,     v6 
#   "355.26" 11 ,    v7 
#   "374.74" 13 ,    v8 
#   "395.07" 15 ,    v9 
#   "416.32" 17 ,    v10
#   "438.50" 19 ,    v11
#   "461.67" 21 ,    v12
#   "485.87" 23 ,    v13
#   "511.14" 25 ,    v
#   "537.54" 27 )    v


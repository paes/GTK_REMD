#!/bin/bash

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
#gnuplot=/opt/local/bin/gnuplot
#gnuplot=/usr/local/Cellar/gnuplot/5.0.1/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'

####NOT WORKING WELL cd $1_RUN1/MD/EnergyDistribution/output/
####NOT WORKING WELL mkdir ../../../../R1R2R3 #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
####NOT WORKING WELL cp ../../../../group_energies.py ../../../../R1R2R3/group_energies.py
####NOT WORKING WELL cp ../../temperatures.dat ../../../../R1R2R3/temperatures.dat
####NOT WORKING WELL 
####NOT WORKING WELL for TEMP in 'cat ../../temperatures.dat'
####NOT WORKING WELL do
####NOT WORKING WELL       tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP._1.dat 
####NOT WORKING WELL done
####NOT WORKING WELL 
####NOT WORKING WELL cd ../../../../$1_RUN2/MD/EnergyDistribution/output/
####NOT WORKING WELL for TEMP in 'cat ../../temperatures.dat'
####NOT WORKING WELL do
####NOT WORKING WELL       tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP._2.dat 
####NOT WORKING WELL done
####NOT WORKING WELL 
####NOT WORKING WELL cd ../../../../$1_RUN3/MD/EnergyDistribution/output/
####NOT WORKING WELL for TEMP in 'cat ../../temperatures.dat'
####NOT WORKING WELL do
####NOT WORKING WELL       tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP._3.dat 
####NOT WORKING WELL done
####NOT WORKING WELL 
####NOT WORKING WELL cd ../../../../R1R2R3/
####NOT WORKING WELL rm overlap_R1R2.dat overlap_R1R3.dat overlap_R2R3.dat
####NOT WORKING WELL for TEMP in 'cat temperatures.dat'     
####NOT WORKING WELL do
####NOT WORKING WELL python group_energies.py  dist_$TEMP_1.dat  dist_$TEMP_2.dat  $2 dist_$TEMP.R1R2.dat  >>  overlap_R1R2.dat
####NOT WORKING WELL python group_energies.py  dist_$TEMP_1.dat  dist_$TEMP_3.dat  $2 dist_$TEMP.R1R3.dat  >>  overlap_R1R3.dat
####NOT WORKING WELL python group_energies.py  dist_$TEMP_2.dat  dist_$TEMP_3.dat  $2 dist_$TEMP.R2R3.dat  >>  overlap_R2R3.dat
####NOT WORKING WELL done      
    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste
# O QUE IMPORTA EH A SAIDA QUE ESSE GROUP_ENERGIES GERA.
python group_energies.py dist_269.5_1.dat  dist_285.22_1.dat 1 dist_269.5_1_285.22_1.dat
python group_energies.py dist_285.22_1.dat dist_301.66_1.dat 1 dist_285.22_1_301.66_1.dat
python group_energies.py dist_301.66_1.dat dist_318.76_1.dat 1 dist_301.66_1_318.76_1.dat
python group_energies.py dist_318.76_1.dat dist_336.61_1.dat 1 dist_318.76_1_336.61_1.dat
python group_energies.py dist_336.61_1.dat dist_355.26_1.dat 1 dist_336.61_1_355.26_1.dat
python group_energies.py dist_355.26_1.dat dist_374.74_1.dat 1 dist_355.26_1_374.74_1.dat
python group_energies.py dist_374.74_1.dat dist_395.07_1.dat 1 dist_374.74_1_395.07_1.dat
python group_energies.py dist_395.07_1.dat dist_416.32_1.dat 1 dist_395.07_1_416.32_1.dat
python group_energies.py dist_416.32_1.dat dist_438.5_1.dat  1 dist_416.32_1_438.5_1.dat 
python group_energies.py dist_438.5_1.dat  dist_461.67_1.dat 1 dist_438.5_1_461.67_1.dat 
python group_energies.py dist_461.67_1.dat dist_485.87_1.dat 1 dist_461.67_1_485.87_1.dat
python group_energies.py dist_485.87_1.dat dist_511.14_1.dat 1 dist_485.87_1_511.14_1.dat
python group_energies.py dist_511.14_1.dat dist_537.54_1.dat 1 dist_511.14_1_537.54_1.dat

python group_energies.py dist_269.5_2.dat  dist_285.22_2.dat 1 dist_269.5_2_285.22_2.dat
python group_energies.py dist_285.22_2.dat dist_301.66_2.dat 1 dist_285.22_2_301.66_2.dat
python group_energies.py dist_301.66_2.dat dist_318.76_2.dat 1 dist_301.66_2_318.76_2.dat
python group_energies.py dist_318.76_2.dat dist_336.61_2.dat 1 dist_318.76_2_336.61_2.dat
python group_energies.py dist_336.61_2.dat dist_355.26_2.dat 1 dist_336.61_2_355.26_2.dat
python group_energies.py dist_355.26_2.dat dist_374.74_2.dat 1 dist_355.26_2_374.74_2.dat
python group_energies.py dist_374.74_2.dat dist_395.07_2.dat 1 dist_374.74_2_395.07_2.dat
python group_energies.py dist_395.07_2.dat dist_416.32_2.dat 1 dist_395.07_2_416.32_2.dat
python group_energies.py dist_416.32_2.dat dist_438.5_2.dat  1 dist_416.32_2_438.5_2.dat 
python group_energies.py dist_438.5_2.dat  dist_461.67_2.dat 1 dist_438.5_2_461.67_2.dat 
python group_energies.py dist_461.67_2.dat dist_485.87_2.dat 1 dist_461.67_2_485.87_2.dat
python group_energies.py dist_485.87_2.dat dist_511.14_2.dat 1 dist_485.87_2_511.14_2.dat
python group_energies.py dist_511.14_2.dat dist_537.54_2.dat 1 dist_511.14_2_537.54_2.dat

python group_energies.py dist_269.5_3.dat  dist_285.22_3.dat 1 dist_269.5_3_285.22_3.dat
python group_energies.py dist_285.22_3.dat dist_301.66_3.dat 1 dist_285.22_3_301.66_3.dat
python group_energies.py dist_301.66_3.dat dist_318.76_3.dat 1 dist_301.66_3_318.76_3.dat
python group_energies.py dist_318.76_3.dat dist_336.61_3.dat 1 dist_318.76_3_336.61_3.dat
python group_energies.py dist_336.61_3.dat dist_355.26_3.dat 1 dist_336.61_3_355.26_3.dat
python group_energies.py dist_355.26_3.dat dist_374.74_3.dat 1 dist_355.26_3_374.74_3.dat
python group_energies.py dist_374.74_3.dat dist_395.07_3.dat 1 dist_374.74_3_395.07_3.dat
python group_energies.py dist_395.07_3.dat dist_416.32_3.dat 1 dist_395.07_3_416.32_3.dat
python group_energies.py dist_416.32_3.dat dist_438.5_3.dat  1 dist_416.32_3_438.5_3.dat 
python group_energies.py dist_438.5_3.dat  dist_461.67_3.dat 1 dist_438.5_3_461.67_3.dat 
python group_energies.py dist_461.67_3.dat dist_485.87_3.dat 1 dist_461.67_3_485.87_3.dat
python group_energies.py dist_485.87_3.dat dist_511.14_3.dat 1 dist_485.87_3_511.14_3.dat
python group_energies.py dist_511.14_3.dat dist_537.54_3.dat 1 dist_511.14_3_537.54_3.dat
      


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
set output "./ln_100w__t2t1.${output_extension}"


####set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

####set xrange [ -1 : 29 ] noreverse nowriteback
set xrange [ -700 : 0 ]
####set yrange [ 0 :] noreverse nowriteback
set yrange [ -8 : 8 ] #noreverse nowriteback
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


plot 'dist_269.5_1_285.22_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "269-285" ,\
	'dist_285.22_1_301.66_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 2 title "285-301" ,\
	'dist_301.66_1_318.76_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 3 title "301-318",\
	'dist_318.76_1_336.61_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 4 title "318-336",\
	'dist_336.61_1_355.26_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 5 title "336-355",\
	'dist_355.26_1_374.74_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 6 title "355-374",\
	'dist_374.74_1_395.07_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 7 title "374-395",\
	'dist_395.07_1_416.32_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 8 title "395-416",\
	'dist_416.32_1_438.5_1.dat'  using (\$1):(log(\$3 / \$2)) with points ls 9 title "416-438" ,\
	'dist_438.5_1_461.67_1.dat'  using (\$1):(log(\$3 / \$2)) with points ls 10 title "438-461",\
	'dist_461.67_1_485.87_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 11 title "461-485",\
	'dist_485.87_1_511.14_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 12 title "485-511",\
	'dist_511.14_1_537.54_1.dat' using (\$1):(log(\$3 / \$2)) with points ls 13 title "511-537";

plot 'dist_269.5_2_285.22_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "269-285" ,\
	'dist_285.22_2_301.66_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "285-301" ,\
	'dist_301.66_2_318.76_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "301-318",\
	'dist_318.76_2_336.61_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "318-336",\
	'dist_336.61_2_355.26_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "336-355",\
	'dist_355.26_2_374.74_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "355-374",\
	'dist_374.74_2_395.07_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "374-395",\
	'dist_395.07_2_416.32_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "395-416",\
	'dist_416.32_2_438.5_2.dat'  using (\$1):(log(\$3 / \$2)) with points ls 1 title "416-438" ,\
	'dist_438.5_2_461.67_2.dat'  using (\$1):(log(\$3 / \$2)) with points ls 1 title "438-461",\
	'dist_461.67_2_485.87_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "461-485",\
	'dist_485.87_2_511.14_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "485-511",\
	'dist_511.14_2_537.54_2.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "511-537";

plot 'dist_269.5_3_285.22_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "269-285" ,\
	'dist_285.22_3_301.66_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "285-301" ,\
	'dist_301.66_3_318.76_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "301-318",\
	'dist_318.76_3_336.61_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "318-336",\
	'dist_336.61_3_355.26_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "336-355",\
	'dist_355.26_3_374.74_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "355-374",\
	'dist_374.74_3_395.07_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "374-395",\
	'dist_395.07_3_416.32_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "395-416",\
	'dist_416.32_3_438.5_3.dat'  using (\$1):(log(\$3 / \$2)) with points ls 1 title "416-438" ,\
	'dist_438.5_3_461.67_3.dat'  using (\$1):(log(\$3 / \$2)) with points ls 1 title "438-461",\
	'dist_461.67_3_485.87_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "461-485",\
	'dist_485.87_3_511.14_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "485-511",\
	'dist_511.14_3_537.54_3.dat' using (\$1):(log(\$3 / \$2)) with points ls 1 title "511-537";


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


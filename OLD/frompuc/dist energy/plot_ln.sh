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
#gnuplot=/usr/local/Cellar/gnuplot/5.0.1/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'


	#  difference=$(expr $4 - $3)
	#  echo $difference ###nesse exemplo a diff eh 21
 #    tail -n +13 dist-energy_$1.xvg > 	   dist_$1.dat  #21 *10 =210
 #    tail -n +13 dist-energy_$2.xvg > 	   dist_$2.dat
      
      
      #local de onde vou rodar => /protein_Xns_simul_runY/MD/EnergyDistribition/output
      #usando $4 como o nome da pasta, sem numero de run, nesse caso seria 1UNC_1ns_1
cd $4_RUN1/MD/EnergyDistribution/output/
mkdir ../../../../R1R2R3 #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp ../../../../group_energies.py ../../../../R1R2R3/group_energies.py
cp temperatures.dat ../../../../R1R2R3/temperatures.dat

for TEMP in 'cat ../../temperatures.dat'
do
      tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP_1.dat 
done

cd ../../../../$4_RUN2/MD/EnergyDistribution/output/
for TEMP in 'cat ../../temperatures.dat'
do
      tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP_2.dat 
done

cd ../../../../$4_RUN3/MD/EnergyDistribution/output/
for TEMP in 'cat ../../temperatures.dat'
do
      tail -n +13 dist-energy_$TEMP.xvg >  ../../../../R1R2R3/dist_$TEMP_3.dat 
done

cd ../../../../R1R2R3/
rm overlap_R1R2.dat overlap_R1R3.dat overlap_R2R3.dat
for TEMP in 'cat temperatures.dat'     
do
python group_energies.py  dist_$TEMP_1.dat  dist_$TEMP_2.dat  10 dist_$TEMP_R1R2.dat  >>  overlap_R1R2.dat
python group_energies.py  dist_$TEMP_1.dat  dist_$TEMP_3.dat  10 dist_$TEMP_R1R3.dat  >>  overlap_R1R3.dat
python group_energies.py  dist_$TEMP_2.dat  dist_$TEMP_3.dat  10 dist_$TEMP_R2R3.dat  >>  overlap_R2R3.dat
done      
    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste
####python group_energies.py  dist_269.5_1.dat  dist_269.5_2.dat  10 dist_301.66_318.76.dat  >  overlap.dat
####python group_energies.py dist_285.22_1.dat dist_285.22_2.dat  10 dist_318.76_336.61.dat  >> overlap.dat
####python group_energies.py dist_301.66_1.dat dist_301.66_2.dat  10 dist_301.66_318.76.dat  >> overlap.dat
####python group_energies.py dist_318.76_1.dat dist_318.76_2.dat  10 dist_318.76_336.61.dat  >> overlap.dat
####python group_energies.py dist_336.61_1.dat dist_336.61_2.dat  10 dist_336.61_355.26.dat  >> overlap.dat
####python group_energies.py dist_355.26_1.dat dist_355.26_2.dat  10 dist_355.26_374.74.dat  >> overlap.dat
####python group_energies.py dist_374.74_1.dat dist_374.74_2.dat  10 dist_374.74_395.07.dat  >> overlap.dat
####python group_energies.py dist_395.07_1.dat dist_395.07_2.dat  10 dist_395.07_416.32.dat  >> overlap.dat
####python group_energies.py dist_416.32_1.dat dist_416.32_2.dat  10  dist_416.32_438.5.dat  >> overlap.dat
####python group_energies.py  dist_438.5_1.dat  dist_438.5_2.dat  10  dist_438.5_461.67.dat  >> overlap.dat
####python group_energies.py dist_461.67_1.dat dist_461.67_2.dat  10 dist_461.67_485.87.dat  >> overlap.dat
####python group_energies.py dist_485.87_1.dat dist_485.87_2.dat  10 dist_485.87_511.14.dat  >> overlap.dat
####python group_energies.py dist_511.14_1.dat dist_511.14_2.dat  10 dist_511.14_537.54.dat  >> overlap.dat
####python group_energies.py dist_537.54_1.dat dist_537.54_2.dat  10 dist_511.14_537.54.dat  >> overlap.dat
####echo "ok"

      
      
      
      
#paste  dist_$1.dat dist_$2.dat > dist_$1_$2.dat
      



#ATUALMENTE OFF $$$$ ##### echo | $gnuplot <<EOF
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ #####  
#ATUALMENTE OFF $$$$ #####    
#ATUALMENTE OFF $$$$ ##### set term ${term}
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### #SOBRE O GRID
#ATUALMENTE OFF $$$$ ##### # Line style for axes
#ATUALMENTE OFF $$$$ ##### set style line 90 lt 1 lc 3
#ATUALMENTE OFF $$$$ ##### set style line 90 lt rgb "#808080"
#ATUALMENTE OFF $$$$ ##### # Line style for grid
#ATUALMENTE OFF $$$$ ##### set style line 81 lt 0  # dashed
#ATUALMENTE OFF $$$$ ##### set style line 81 lt rgb "#808080"  # grey
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set grid back linestyle 81
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set border 3 linestyle 90 
#ATUALMENTE OFF $$$$ ##### 	     # Remove border on top and right.  These
#ATUALMENTE OFF $$$$ #####              # borders are useless and make it harder
#ATUALMENTE OFF $$$$ #####              # to see plotted lines near the border.
#ATUALMENTE OFF $$$$ #####  	     # Also, put it in grey; no need for so much emphasis on a border.
#ATUALMENTE OFF $$$$ #####  	     
#ATUALMENTE OFF $$$$ #####  	     
#ATUALMENTE OFF $$$$ #####  	     
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### # set terminal png transparent nocrop enhanced size 450,320 font "arial,8" 
#ATUALMENTE OFF $$$$ ##### set output "./ln_t1t2.${output_extension}"
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### ####set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### ####set xrange [ -1 : 29 ] noreverse nowriteback
#ATUALMENTE OFF $$$$ ##### ####set yrange [ 0 :] noreverse nowriteback
#ATUALMENTE OFF $$$$ ##### set xtics font ", 6"
#ATUALMENTE OFF $$$$ ##### set ytics font ", 8"
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set border 2 front linewidth 1.000
#ATUALMENTE OFF $$$$ ##### set xtics  norangelimit nomirror
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set ytics border in scale 1,0.5 nomirror norotate  autojustify
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set style fill solid 0.45 border
#ATUALMENTE OFF $$$$ ##### #set boxwidth 0.2 absolute
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### # Put X and Y labels
#ATUALMENTE OFF $$$$ ##### set xlabel "energy"
#ATUALMENTE OFF $$$$ ##### set ylabel "ln "
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### #legenda
#ATUALMENTE OFF $$$$ ##### set key horizontal center bottom outside maxrows 1
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### # Give the plot a title
#ATUALMENTE OFF $$$$ ##### set title "ln [P(E,T2)/P(E,T1)] "
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
#ATUALMENTE OFF $$$$ ##### set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orange"
#ATUALMENTE OFF $$$$ ##### set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "yellow"
#ATUALMENTE OFF $$$$ ##### set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "green"
#ATUALMENTE OFF $$$$ ##### set style line 5 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "seagreen"
#ATUALMENTE OFF $$$$ ##### set style line 6 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "cyan"
#ATUALMENTE OFF $$$$ ##### set style line 7 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
#ATUALMENTE OFF $$$$ ##### set style line 8 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "violet"
#ATUALMENTE OFF $$$$ ##### set style line 9 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "magenta"
#ATUALMENTE OFF $$$$ ##### set style line 10 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "gold"
#ATUALMENTE OFF $$$$ ##### set style line 11 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orchid"
#ATUALMENTE OFF $$$$ ##### set style line 12 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "black"
#ATUALMENTE OFF $$$$ ##### set style line 13 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#FF69B4
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### plot 'dist_$1_$2.dat'  using (\$1):(log(\$3 / \$2))        with linespoints ls 1  title         "$1" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_$2_301.66.dat'  using (\$1):(log(\$3 / \$2))     with linespoints ls 2  title     "$2" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_301.66_318.76.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 3  title "301",\
#ATUALMENTE OFF $$$$ ##### 	'dist_318.76_336.61.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 4  title "318",\
#ATUALMENTE OFF $$$$ ##### 	'dist_336.61_355.26.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 5  title "336",\
#ATUALMENTE OFF $$$$ ##### 	'dist_355.26_374.74.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 6  title "355",\
#ATUALMENTE OFF $$$$ ##### 	'dist_374.74_395.07.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 7  title "374",\
#ATUALMENTE OFF $$$$ ##### 	'dist_395.07_416.32.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 8  title "395",\
#ATUALMENTE OFF $$$$ ##### 	'dist_416.32_438.5.dat'  using (\$1):(log(\$3 / \$2))  with linespoints ls 9  title "416" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_438.5_461.67.dat'  using (\$1):(log(\$3 / \$2))  with linespoints ls 10 title "438",\
#ATUALMENTE OFF $$$$ ##### 	'dist_461.67_485.87.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 11 title "461",\
#ATUALMENTE OFF $$$$ ##### 	'dist_485.87_511.14.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 12 title "485",\
#ATUALMENTE OFF $$$$ ##### 	'dist_511.14_537.54.dat'  using (\$1):(log(\$3 / \$2)) with linespoints ls 13 title "511";
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### plot 'dist_$1_$2.dat'  using (\$1):(log(\$2 / \$3))        with linespoints ls 1  title         "$1" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_$2_301.66.dat'  using (\$1):(log(\$2 / \$3))     with linespoints ls 2  title     "$2" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_301.66_318.76.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 3  title "301",\
#ATUALMENTE OFF $$$$ ##### 	'dist_318.76_336.61.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 4  title "318",\
#ATUALMENTE OFF $$$$ ##### 	'dist_336.61_355.26.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 5  title "336",\
#ATUALMENTE OFF $$$$ ##### 	'dist_355.26_374.74.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 6  title "355",\
#ATUALMENTE OFF $$$$ ##### 	'dist_374.74_395.07.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 7  title "374",\
#ATUALMENTE OFF $$$$ ##### 	'dist_395.07_416.32.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 8  title "395",\
#ATUALMENTE OFF $$$$ ##### 	'dist_416.32_438.5.dat'  using (\$1):(log(\$2 / \$3))  with linespoints ls 9  title "416" ,\
#ATUALMENTE OFF $$$$ ##### 	'dist_438.5_461.67.dat'  using (\$1):(log(\$2 / \$3))  with linespoints ls 10 title "438",\
#ATUALMENTE OFF $$$$ ##### 	'dist_461.67_485.87.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 11 title "461",\
#ATUALMENTE OFF $$$$ ##### 	'dist_485.87_511.14.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 12 title "485",\
#ATUALMENTE OFF $$$$ ##### 	'dist_511.14_537.54.dat'  using (\$1):(log(\$2 / \$3)) with linespoints ls 13 title "511";
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### 
#ATUALMENTE OFF $$$$ ##### EOF

# plot "../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj.269.50.dat" using (1-0.45):2 ls 1 with boxplot title "CTREMD" ,\
#   "269.50" 1 , 
#   "285.22" 3 , 
#   "301.66" 5 , 
#   "318.76" 7 , 
#   "336.61" 9 , 
#   "355.26" 11 , 
#   "374.74" 13 , 
#   "395.07" 15 , 
#   "416.32" 17 , 
#   "438.50" 19 , 
#   "461.67" 21 , 
#   "485.87" 23 , 
#   "511.14" 25 , 
#   "537.54" 27 )


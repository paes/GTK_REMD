#!/bin/bash

#### USAGE: boxplot_gdt (ns) (SEED)
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

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'

mkdir plots
cd plots

echo | $gnuplot <<EOF

set term ${term}

#set size 2,2

# Line style for grid
# Define a new linestyle (81)
# linetype = 0 (dashed line)
# linecolor = gray
# lw = lineweight, make it half as wide as the axes lines
set style line 81 lt 0 lc rgb "#808080" lw 0.5

# Draw the grid lines for both the major and minor tics
set grid xtics
set grid ytics
set grid mxtics
set grid mytics
# Put the grid behind anything drawn and use the linestyle 81
set grid back ls 81


# Margins for each row resp. column
#TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.55"
#BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.20"
#LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
#RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"


set output "./quartile_gdt.${output_extension}"
set boxwidth 1.0 #absolute

#set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)
set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)


# macros


# Put X and Y labels
set xlabel "Temperature (K)"
set ylabel "GDT/100 


set xrange [ -2.5 : 36 ] noreverse nowriteback
set yrange [ -0.1 : 0.9] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 6"

set border 2 front linewidth 1.000
set boxwidth 0.5 absolute
set xtics  norangelimit nomirror rotate by -45  autojustify 
set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
set boxwidth 0.3 absolute


#legenda
#set key horizontal center bottom inside maxrows 1

set key autotitle column nobox samplen 1 noenhanced
set key samplen 2 spacing .5 font ",8"

# Give the plot a title
#set title "Quartile GDT v.s Temperature "



set style line 1 lt 1 ps 0.015 lc rgb "blue"
set style line 2 lt 1 ps 0.015 lc rgb "red" 
set style line 3 lt 1 ps 0.015 lc rgb "#FF69B4"
set style line 4 lt 1 ps 0.015 lc rgb "#00FF00"


set style data boxplot
set multiplot layout 2,2 rowsfirst title "Quartile GDT v.s Temperature"

set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)
set ylabel 'GDT/100' 
set ylabel font ",8"
set xlabel font ",8"

set format y '%0.1f'
set ytics (0, 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)
unset xlabel
set xtics ('' 1, '' 3.5, '' 6, '' 8.5, '' 11, '' 13.5, '' 16, '' 18.5, '' 21, '' 23.5, '' 26, '' 28.5, '' 31, '' 33.5) 




# Margins for each row resp. column
set tmargin at screen 0.90; set bmargin at screen 0.55
set lmargin at screen 0.15; set rmargin at screen 0.55

set xtics scale 0

plot "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.269.50.dat" using (1):2    ls 1 ps 0.015 with boxplot title "CT-REMD" ,\
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.285.22.dat" using (3.5):2  ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.301.66.dat" using (6):2    ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.318.76.dat" using (8.5):2  ls 1 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.336.61.dat" using (11):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.355.26.dat" using (13.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.374.74.dat" using (16):2   ls 1 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.395.07.dat" using (18.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.416.32.dat" using (21):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.438.50.dat" using (23.5):2 ls 1 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.461.67.dat" using (26):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.485.87.dat" using (28.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.511.14.dat" using (31):2   ls 1 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_1_RUN$2/MD/gdt-total_Ttraj.537.54.dat" using (33.5):2 ls 1 ps 0.015 with boxplot notitle

set border 1 front linewidth 0.000

# Margins for each row resp. column
set tmargin at screen 0.90; set bmargin at screen 0.55
set lmargin at screen 0.55; set rmargin at screen 0.95
unset xlabel
unset ylabel
set format y ''
plot "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.269.50.dat" using (1):2    ls 2 ps 0.025 with boxplot title "T-REMD" ,\
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.285.22.dat" using (3.5):2  ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.301.66.dat" using (6):2    ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.318.76.dat" using (8.5):2  ls 2 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.336.61.dat" using (11):2   ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.355.26.dat" using (13.5):2 ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.374.74.dat" using (16):2   ls 2 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.395.07.dat" using (18.5):2 ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.416.32.dat" using (21):2   ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.438.50.dat" using (23.5):2 ls 2 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.461.67.dat" using (26):2   ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.485.87.dat" using (28.5):2 ls 2 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.511.14.dat" using (31):2   ls 2 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_2_RUN$2/MD/gdt-total_Ttraj.537.54.dat" using (33.5):2 ls 2 ps 0.025 with boxplot notitle

#set xtics ('269.50' 1, '285.22' 3, '301.66' 5, '318.76' 7, '336.61' 9, '355.26' 11, '374.74' 13, '395.07' 15, '416.32' 17, '438.50' 19, '461.67' 21, '485.87' 23, '511.14' 25, '537.54' 27)
set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)

set xlabel "Temperature (K)"
set ylabel 'GDT/100'

set xtics scale 1
set border 3 front linewidth 1.000

# Margins for each row resp. column
set tmargin at screen 0.55; set bmargin at screen 0.20
set lmargin at screen 0.15; set rmargin at screen 0.55
set ytics (0, 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)
set format y '%0.1f'
set ylabel font ",8"
set xlabel font ",8"
plot "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.001.dat" using (1):2    ls 3 ps 0.025 with boxplot title "C-MD" ,\
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.002.dat" using (3.5):2  ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.003.dat" using (6):2    ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.004.dat" using (8.5):2  ls 3 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.005.dat" using (11):2   ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.006.dat" using (13.5):2 ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.007.dat" using (16):2   ls 3 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.008.dat" using (18.5):2 ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.009.dat" using (21):2   ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.010.dat" using (23.5):2 ls 3 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.011.dat" using (26):2   ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.012.dat" using (28.5):2 ls 3 ps 0.025 with boxplot notitle, \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.013.dat" using (31):2   ls 3 ps 0.025 with boxplot notitle , \
	 "../1UNC_$1ns_3_RUN$2/MD/gdt-total_Ttraj.014.dat" using (33.5):2 ls 3 ps 0.025 with boxplot notitle


set border 1 front linewidth 1.000
# Margins for each row resp. column
set tmargin at screen 0.55; set bmargin at screen 0.20
set lmargin at screen 0.55; set rmargin at screen 0.95
unset ylabel	
set format y '' 
set ytics scale 0
set xlabel font ",8"
plot "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.001.dat" using (1):2    ls 4 ps 0.015 with boxplot title "MD" ,\
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.002.dat" using (3.5):2  ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.003.dat" using (6):2    ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.004.dat" using (8.5):2  ls 4 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.005.dat" using (11):2   ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.006.dat" using (13.5):2 ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.007.dat" using (16):2   ls 4 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.008.dat" using (18.5):2 ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.009.dat" using (21):2   ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.010.dat" using (23.5):2 ls 4 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.011.dat" using (26):2   ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.012.dat" using (28.5):2 ls 4 ps 0.015 with boxplot notitle, \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.013.dat" using (31):2   ls 4 ps 0.015 with boxplot notitle , \
	 "../1UNC_$1ns_4_RUN$2/MD/gdt-total_Ttraj.014.dat" using (33.5):2 ls 4 ps 0.015 with boxplot notitle
	 
unset multiplot
EOF
mkdir plots_$1
mv quartile_gdt.pdf plots_$1/ 
cd '..'

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


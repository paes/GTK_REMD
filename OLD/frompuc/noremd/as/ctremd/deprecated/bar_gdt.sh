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

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'

echo | $gnuplot <<EOF

set term ${term}

# Put X and Y labels
set xlabel "Temperature (K)"
set ylabel "GDT_TS"

# Give the plot a title
set title "Average, Minimum and Maximum GDT_TS v.s Temperature"

# Set the range of our x and y axes
set xrange [260:545]
#set yrange [0:13]




#set autoscale
set grid

set grid noxtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics

set style data histogram
set style histogram rowstack
#set style fill pattern border
set style fill solid noborder
set style fill transparent solid 0.95 noborder

set grid noxtic ytic
#set key above vertical maxrows 2 Right

# Note you need gnuplot 4.4 for the pdfcairo terminal.
#set terminal pdfcairo font "Gill Sans,9" linewidth 2 rounded fontscale 0.5

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

#set origin 0.0,0.07
#set size 1, 0.9

set yrange [0:]
set boxwidth 0.6 relative

#set label 1 "first new command" at graph 0.624, 0.90, 0 right norotate  textcolor rgb "black"  nopoint 
#set label 2 "" at graph 0.644, 0.90, 0 right norotate  textcolor rgb "black"  point pointtype 13 pointsize 0.8
#set label 3 "" at graph 0.168, 0.540, 0 left front norotate  textcolor rgb "gray30" point pointtype 13 pointsize 0.8
#set label 4 "" at graph 0.418, 0.176, 0 left front norotate  textcolor rgb "gray30" point pointtype 13 pointsize 0.8
#set label 5 "" at graph 0.666, 0.115, 0 left front norotate  textcolor rgb "gray30" point pointtype 13 pointsize 0.8
#set label 6 "" at graph 0.750, 0.099, 0 left front norotate  textcolor rgb "gray30" point pointtype 13 pointsize 0.8
#set label 7 "" at graph 0.833, 0.087, 0 left front norotate  textcolor rgb "gray30" point pointtype 13 pointsize 0.8
#set label 8 "" at graph 0.917, 0.116, 0 left front norotate  textcolor rgb "gray30"  point pointtype 13 pointsize 0.8

#set label 9 "P1" at graph 0.685, -0.04, 0 right norotate  textcolor rgb "black"  nopoint 
#set label 10 "P2" at graph 0.765, -0.04, 0 right norotate  textcolor rgb "black"  nopoint 
#set label 11 "P3" at graph 0.85, -0.04, 0 right norotate  textcolor rgb "black"  nopoint 
#set label 12 "P4" at graph 0.935, -0.04, 0 right norotate  textcolor rgb "black"  nopoint 

#set label 13 "Classical" at graph 0.17, -0.1, 0 center norotate  textcolor rgb "black"  nopoint 
#set label 14 "Speedy" at graph 0.42, -0.1, 0 center norotate  textcolor rgb "black"  nopoint 
#set label 15 "Speedy + on-demand" at graph 0.79, -0.1, 0 center norotate  textcolor rgb "black"  nopoint 

set key horizontal bottom center inside maxrows 1

#set bmargin 3
#set xtics offset 4,-1,0
unset xtics

set output "./bar.${output_extension}"

#set xtics("200" 1, "" 2, "300" 3) 
#set xtics("200" 1, "300" 3) 


set style line 1 lt 1 lc rgb "#4169E1" lw 2 pt 13 ps 0.5
set style line 1 lt 1 lc rgb "blue" lw 2 pt 13 ps 0.5
set style line 2 lt 1 lc rgb "red" lw 2 pt 13 ps 0.5
set style line 3 lt 1 lc rgb "#FF69B4" lw 2 pt 13 ps 0.5
set style line 4 lt 1 lc rgb "#00FF00" lw 2 pt 13 ps 0.5

set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

set xrange [-1:29]
set xtic rotate by -45
set boxwidth 0.25

set xtics font ", 8"
set ytics font ", 8"
set mytics 2.5


set tics scale 0.5

set ytics nomirror
set xtics nomirror
plot "< awk 'NR==1' data.dat" using (1-0.25):2:3:4  ls 1 with yerrorbars title "CTREMD", \
     "< awk 'NR==1' data.dat" using (1-0.125):6:7:8  ls 2 with yerrorbars title "REMD" , \
	 "< awk 'NR==1' data.dat" using (1+0.125):14:15:16 ls 4 with yerrorbars title "CMD" , \
	 "< awk 'NR==1' data.dat" using (1+0.25):10:11:12 ls 3 with yerrorbars title "MD" , \
	 "< awk 'NR==2' data.dat" using (3-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==2' data.dat" using (3-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==2' data.dat" using (3+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==2' data.dat" using (3+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==3' data.dat" using (5-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==3' data.dat" using (5-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==3' data.dat" using (5+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==3' data.dat" using (5+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	"< awk 'NR==4' data.dat" using (7-0.25):2:3:4  ls 1 with yerrorbars notitle, \
   "< awk 'NR==4' data.dat" using (7-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==4' data.dat" using (7+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==4' data.dat" using (7+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==5' data.dat" using (9-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==5' data.dat" using (9-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==5' data.dat" using (9+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==5' data.dat" using (9+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==6' data.dat" using (11-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==6' data.dat" using (11-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==6' data.dat" using (11+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==6' data.dat" using (11+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==7' data.dat" using (13-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==7' data.dat" using (13-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==7' data.dat" using (13+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==7' data.dat" using (13+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==8' data.dat" using (15-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==8' data.dat" using (15-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==8' data.dat" using (15+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==8' data.dat" using (15+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==9' data.dat" using (17-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==9' data.dat" using (17-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==9' data.dat" using (17+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==9' data.dat" using (17+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==10' data.dat" using (19-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==10' data.dat" using (19-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==10' data.dat" using (19+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==10' data.dat" using (19+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==11' data.dat" using (21-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==11' data.dat" using (21-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==11' data.dat" using (21+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==11' data.dat" using (21+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==12' data.dat" using (23-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==12' data.dat" using (23-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==12' data.dat" using (23+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==12' data.dat" using (23+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==13' data.dat" using (25-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==13' data.dat" using (25-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==13' data.dat" using (25+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==13' data.dat" using (25+0.25):10:11:12  ls 3 with yerrorbars notitle, \
	 "< awk 'NR==14' data.dat" using (27-0.25):2:3:4  ls 1 with yerrorbars notitle, \
     "< awk 'NR==14' data.dat" using (27-0.125):6:7:8  ls 2 with yerrorbars notitle, \
	 "< awk 'NR==14' data.dat" using (27+0.125):14:15:16  ls 4 with yerrorbars notitle, \
	 "< awk 'NR==14' data.dat" using (27+0.25):10:11:12  ls 3 with yerrorbars notitle
EOF

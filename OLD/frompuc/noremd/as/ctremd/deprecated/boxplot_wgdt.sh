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

# set terminal png transparent nocrop enhanced size 450,320 font "arial,8" 
set output "./box4.${output_extension}"
set boxwidth 0.2 absolute

set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

set xrange [ 6 : 8 ] noreverse nowriteback
set yrange [ 0 :] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set boxwidth 0.5 absolute
set xtics  norangelimit nomirror
set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Temperature (K)"
set ylabel "GDT/100 "

#legenda
set key horizontal center bottom inside maxrows 1

# Give the plot a title
set title "Quartile GDT v.s Temperature "

set style line 1 lt 1 lc rgb "#4169E1" lw 2 pt 13 ps 0.5
set style line 1 lt 1 lc rgb "blue" lw 2 pt 13 ps 0.5
set style line 2 lt 1 lc rgb "red" lw 2 pt 13 ps 0.5
set style line 3 lt 1 lc rgb "#FF69B4" lw 2 pt 13 ps 0.5
set style line 4 lt 1 lc rgb "#00FF00" lw 2 pt 13 ps 0.5

plot "< awk 'NR==4' data-q.dat" using (7-0.45):3:2:6:5 with candlesticks ls 1 notitle "CTREMD" whiskerbars 0.5 , \
     "< awk 'NR==4' data-q.dat" using (7-0.45):4:4:4:4 with candlesticks ls 1 notitle, \
     "< awk 'NR==4' data-q.dat" using (7-0.15):9:8:12:11 with candlesticks ls 2 notitle "REMD" whiskerbars 0.5 , \
     "< awk 'NR==4' data-q.dat" using (7-0.15):10:10:10:10 with candlesticks ls 2 notitle, \
     "< awk 'NR==4' data-q.dat" using (7+0.15):15:14:18:17 with candlesticks ls 3 notitle "CMD" whiskerbars 0.5 , \
     "< awk 'NR==4' data-q.dat" using (7+0.15):16:16:16:16 with candlesticks ls 3 notitle, \
     "< awk 'NR==4' data-q.dat" using (7+0.45):21:20:24:23 with candlesticks ls 4 notitle "MD" whiskerbars 0.5 , \
     "< awk 'NR==4' data-q.dat" using (7+0.45):22:22:22:22 with candlesticks ls 4 notitle
EOF

set datafile separator ","
set terminal pngcairo size 900,550 enhanced font "Arial,10"
set output "results/soak_10x_chart.png"

set title "Multi-Iteration Soak Test Analysis (Sustained Performance Variance)" font "Arial,12;Bold"
set xlabel "Test Iteration Sequence (Run #)"
set grid

# Configure Left Y-Axis for Average Response Time
set ylabel "Average Response Time (Seconds)" textcolor rgb "#1d3557"
set yrange [0:*]

# Configure Right Y-Axis for Max Outlier Latency to spot structural spikes
set y2label "Longest Transaction Outlier (Seconds)" textcolor rgb "#e63946"
set y2tics textcolor rgb "#e63946"
set y2range [0:*]

# Siege Compiled Mapping: 
# Column 1 = Iteration Run Number
# Column 4 = Average Response Time
# Column 7 = Longest Transaction Outlier
plot "results/soak_10x_compiled.csv" using 1:4 with linespoints lw 3 lc rgb "#457b9d" pt 7 ps 1.5 title "Avg Response Time per Run", \
     "results/soak_10x_compiled.csv" using 1:7 with linespoints lw 2 lc rgb "#e63946" pt 5 ps 1.2 axes x1y2 title "Worst-Case Latency Outlier"

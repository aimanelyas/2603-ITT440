set terminal png size 900,550 font "Sans,10"
set output "pictures/stress_test_chart.png"

set title "Stress Test Evaluation: Latency Degradation & Socket Resets vs Concurrency" font "Sans-Bold,12"
set xlabel "Measured Application Concurrency (Active Users)" font "Sans-Bold,10"
set ylabel "Processing Delay Scales (Seconds)" font "Sans-Bold,10"

set grid linetype 1 linewidth 0.5 lc rgb "#D3D3D3"
set datafile separator ","


set key box opaque font "Sans,9" top left

# Column 8 = Measured Concurrency (X-axis)
# Column 5 = Average Response Time, Column 11 = Longest Transaction
plot "../results/stress_test_final.csv" using 8:5 title "Average Response Time" with linespoints lw 2.5 lc rgb "#4169E1", \
     "../results/stress_test_final.csv" using 8:11 title "Longest Transaction Boundary" with linespoints lw 2 lc rgb "#DC143C",
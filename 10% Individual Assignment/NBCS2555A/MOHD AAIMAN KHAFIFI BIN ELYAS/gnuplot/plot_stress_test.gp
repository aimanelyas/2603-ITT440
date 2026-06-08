set terminal png size 900,550 font "Sans,10"
set output "pictures/stress_test_chart.png"

set title "Stress Test Evaluation: Latency Degradation & Socket Resets vs Concurrency" font "Sans-Bold,12"
set xlabel "Measured Application Concurrency (Active Users)" font "Sans-Bold,10"
set ylabel "Processing Delay Scales (Seconds)" font "Sans-Bold,10"
set y2label "Transaction Rate (trans/sec) & Failed Transactions Count" font "Sans-Bold,10"

set grid linetype 1 linewidth 0.5 lc rgb "#D3D3D3"
set datafile separator ","

set ytics nomirror
set y2tics autofreq

set key box opaque font "Sans,9" top left

# Column 8 = Measured Concurrency (X-axis)
# Column 5 = Average Response Time, Column 11 = Longest Transaction
plot "../results/stress_test_final.csv" using 8:5 title "Average Response Time" with linespoints lw 2.5 lc rgb "#4169E1", \
     "../results/stress_test_final.csv" using 8:11 title "Longest Transaction Boundary" with linespoints lw 2 lc rgb "#DC143C", \
     "../results/stress_test_final.csv" using 8:6 axes x1y2 title "Transaction Rate (Trans Rate)" with linespoints lw 2 lc rgb "#228B22" dt 4, \
     "../results/stress_test_final.csv" using 8:10 axes x1y2 title "Failed Transactions (FailTx)" with linespoints lw 2 lc rgb "#FF8C00" dt 2    
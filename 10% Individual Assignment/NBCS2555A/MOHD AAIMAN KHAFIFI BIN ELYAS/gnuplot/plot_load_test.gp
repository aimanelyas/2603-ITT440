set terminal png size 900,550 font "Sans,10"
set output "pictures/load_test_chart.png"

set title "Load Test Evaluation: Stability and Latency Trends Over Time (50 Concurrency)" font "Sans-Bold,12"
set xlabel "Test Execution Intervals (1-Minute Intervals)" font "Sans-Bold,10"
set ylabel "Response Time Scales (Seconds)" font "Sans-Bold,10"

set grid linetype 1 linewidth 0.5 lc rgb "#D3D3D3"
set datafile separator ","


set key box opaque font "Sans,9" top left

# Column 5 = Avg Response Time, Column 11 = Longest Transaction, Column 10 = Failed Transactions
plot "../results/load_test_final.csv" using 0:5 title "Average Response Time" with linespoints lw 2.5 lc rgb "#4169E1", \
     "../results/load_test_final.csv" using 0:11 title "Longest Transaction (Max Latency Boundary)" with linespoints lw 2 lc rgb "#DC143C" dt 2, \
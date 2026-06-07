set terminal png size 900,550 font "Sans,10"
set output "pictures/spike_test_chart.png"

set title "Spike Test Evaluation: Traffic Surge Absorption & Capacity Recovery" font "Sans-Bold,12"
set xlabel "Testing Execution Phases" font "Sans-Bold,10"
set ylabel "Concurrent Active Threads" font "Sans-Bold,10"
set y2label "Throughput Capacity (Transactions/sec)" font "Sans-Bold,10"

set grid linetype 1 linewidth 0.5 lc rgb "#D3D3D3"
set datafile separator ","

set key box opaque font "Sans,9" top right

# Column 8 = Concurrency (Left Axis Bar), Column 6 = Transaction Rate (Right Axis Line)
plot "../results/spike_test_final.csv" using 0:8 title "Simulated User Concurrency" with boxes fill solid 0.15 lc rgb "#808080", \
     "../results/spike_test_final.csv" using 0:6 axes x1y2 title "Transaction Rate (Throughput)" with linespoints lw 3 lc rgb "#228B22", \
     "../results/spike_test_final.csv" using 0:5 axes x1y2 title "Avg Response Time (s)" with linespoints lw 2 lc rgb "#4169E1" dt 3
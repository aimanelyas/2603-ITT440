set terminal png size 900,600
set output "pictures/stress_latency_trends.png"

set title "Stress Test Latency Escalation: Average vs Max Boundary"
set xlabel "Measured Target Concurrency (Users)"
set ylabel "Time Scales (Seconds)"

set grid
set datafile separator ","

# Tell Gnuplot to read our custom row 1 headers
set key autotitle columnhead

# Column 8 = Measured Concurrency (X Axis)
# Column 5 = Average Response Time (Y Axis)
# Column 11 = Your newly injected Longest Transaction value (Y Axis)
plot "../results/stress_test_normal_final.csv" using 8:11 title "Longest Transaction (Normal)" with linespoints lw 2 lc rgb "#4169E1", \
     "../results/stress_test_normal_final.csv" using 8:5  title "Average Response Time (Normal)" with linespoints lw 2 lc rgb "blue"
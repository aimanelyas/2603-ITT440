
#remove old results
rm -f ../results/spike_test.csv ../error_logs/spike_errors.txt

#run spike test
siege -v -b -t1M -c10 --log=../results/spike_test.csv https://the-internet.herokuapp.com/ 2>> ../error_logs/spike_errors.txt
siege -v -b -t1M -c200 --log=../results/spike_test.csv https://the-internet.herokuapp.com/ 2>> ../error_logs/spike_errors.txt
siege -v -b -t1M -c10 --log=../results/spike_test.csv https://the-internet.herokuapp.com/ 2>> ../error_logs/spike_errors.txt

#adding "longest transaction" data points to the final CSV file

# 1. Scrape all 'Longest transaction' values out of the text log file
mapfile -t LONGEST_VALUES < <(grep "Longest transaction:" ../error_logs/spike_errors.txt | awk '{print $3}')

# 2. Add a clean header to your new output file
echo -e "\tDate & Time,  Trans,\tElap Time,\tData Trans,\tResp Time,\tTrans Rate, \tThroughput,\tConcurrent,\tOKTx,\tFailTx, Longest_Transaction," > ../results/spike_test_final.csv

# 3. Read the original CSV line-by-line and paste the matched max latency to the end
LINE_COUNT=0
while IFS= read -r line
do
    # Ignore rows that start with '#' (Siege's built-in header remarks)
    if [[ ! "$line" =~ ^# ]] && [[ -n "$line" ]]; then
        # Skip the first header row if the CSV includes a human-readable header
        trimmed_line="${line#${line%%[![:space:]]*}}"
        if [[ "$trimmed_line" == Date\ \&\ Time,* ]]; then
            continue
        fi

        # Fetch the corresponding array value for this specific test tier row
        MAX_LATENCY=${LONGEST_VALUES[$LINE_COUNT]}

        # Append the value to the end of the line separated by a comma
        echo "${line},${MAX_LATENCY}" >> ../results/spike_test_final.csv
        
        # Advance row index counter
        ((LINE_COUNT++))
    fi
done < "../results/spike_test.csv"

rm -f ../results/spike_test.csv
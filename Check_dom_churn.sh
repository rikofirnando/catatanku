#!/bin/bash

echo "How many days ago do you want to input? (e.g. 2, 3, 4, 5) day ago"
read days_ago

# Variables
current_month=$(date +%Y%m)
current_date=$(date "+%Y-%m-%d %T")
last_date=$(date --date="$days_ago day ago" "+%Y-%m-%d")
yesterday=$(date --date="$days_ago day ago" +%Y%m%d)

# CHURN FILES
echo "CHECKING CHURN FILES..."
churn_files=$(ssh -q -t apps@prod7 "ls -lrt /home/bifile/bi_file/Churn_${current_month}*.txt.done; echo \"TOTAL CHURN FILES= \$(ls -lrt /home/bifile/bi_file/Churn_${current_month}*.txt.done | wc -l)\"" 2>/dev/null)

# COUNTING THE NUMBER OF LINES IN CHURN FILES
echo "COUNTING THE NUMBER OF LINES IN CHURN FILES..."
countlines_churn_files=$(ssh -q -t apps@prod7 "wc -l /home/bifile/bi_file/Churn_${current_month}*.txt.done" | tail -n 1 | awk '{print "TOTAL CHURN RECORDS: " $1}' 2>/dev/null)

# DOM FILES
echo "CHECKING DOM FILES..."
dom_files=$(ssh -q -t apps@prod7 "ls -lrt /home/bifile/bi_file/done/DOM_LOENA_${yesterday}*.txt.done; echo \"TOTAL DOM FILES= \$(ls -lrt /home/bifile/bi_file/done/DOM_LOENA_${yesterday}*.txt.done | wc -l)\"" 2>/dev/null)

# COUNTING THE NUMBER OF LINES IN DOM FILES
echo "COUNTING THE NUMBER OF LINES IN DOM FILES..."
countlines_dom_files=$(ssh -q -t apps@prod7 "wc -l /home/bifile/bi_file/done/DOM_LOENA_${yesterday}*.txt.done" | tail -n 1 | awk '{print "TOTAL DOM RECORDS: " $1}' 2>/dev/null)

# CHECK SERVICES
echo "CHECKING CHURN SERVICE..."
churn_service=$(ssh -q -t apps@prod7 "ps aux | grep be_pt_churn" 2>/dev/null)
echo "CHECKING DOM SERVICE..."
dom_service=$(ssh -q -t apps@prod7 "ps aux | grep be_pt_dom" 2>/dev/null)

# Print the Result
echo "Date Ago: $last_date"
echo "$churn_files"
echo "$countlines_churn_files"
echo "$dom_files"
echo "$countlines_dom_files"
echo "========================================================================================================"
echo "Date Now: $current_date"
echo -e "CHURN SERVICE\n $churn_service"
echo "========================================================================================================"
echo -e "DOM SERVICE\n $dom_service"

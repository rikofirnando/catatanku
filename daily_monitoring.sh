#!/bin/bash

# Show How many days ago do you want to input?
echo "How many days ago do you want to input? (e.g. 2, 3, 4, 5) day ago"
read -r days_ago

# Variables
yesterday=$(date --date="$days_ago day ago" +%Y%m%d)
last_day=$(date --date="$days_ago day ago" +%Y-%m-%d)

echo "CALCULATING DAILY LOAN RECORD PROD5..."
ssh_cmd="$(cat <<-EOF
    cd /apps/loena2/logs/frontend/tomcat_loan_record/;
    if [ -n "\$(find . -name "LOAN_RECORD_${yesterday}_*.log" -print -quit)" ]; then
        total_loan_record_prod5=\$(wc -l */LOAN_RECORD_${yesterday}_*.log | tail -n 1 | awk '{print "TOTAL LOAN RECORD PROD 5="\$1}')
        echo "\$total_loan_record_prod5"
    elif [ -n "\$(find . -name "LOAN_RECORD_${yesterday}_*.log.gz" -print -quit)" ]; then
        total_loan_record_prod5=\$(wc -l */LOAN_RECORD_${yesterday}_*.log.gz | tail -n 1 | awk '{print "TOTAL LOAN RECORD PROD5="\$1}')
        echo "\$total_loan_record_prod5"
    else
        echo "No LOAN_RECORD_${yesterday} log files found"
    fi
EOF
)"

total_loan_record_prod5=$(ssh -q -t apps@prod5 "$ssh_cmd" 2>/dev/null)

echo "CALCULATING DAILY LOAN RECORD PROD6..."
ssh_cmd="$(cat <<-EOF
    cd /apps/loena2/logs/frontend/tomcat_loan_record/;
        if [ -n "\$(find . -name "LOAN_RECORD_${yesterday}_*.log" -print -quit)" ]; then
        total_loan_record_prod6=\$(wc -l */LOAN_RECORD_${yesterday}_*.log | tail -n 1 | awk '{print "TOTAL LOAN RECORD PROD 6="\$1}')
        echo "\$total_loan_record_prod6"
    elif [ -n "\$(find . -name "LOAN_RECORD_${yesterday}_*.log.gz" -print -quit)" ]; then
        total_loan_record_prod6=\$(wc -l */LOAN_RECORD_${yesterday}_*.log.gz | tail -n 1 | awk '{print "TOTAL LOAN RECORD PROD 6="\$1}')
        echo "\$total_loan_record_prod6"
    else
        echo "No LOAN_RECORD_${yesterday} log files found"
    fi
EOF
)"

total_loan_record_prod6=$(ssh -q -t apps@prod6 "$ssh_cmd" 2>/dev/null)

# GABUNGAN LOAN RECORD 5 & 6
echo "CALCULATING THE TOTAL LOAN RECORD..."
total_loan_record_prod5_6=$(ssh -q -t apps@prod6 ssh -q -t birefusr@10.54.3.206 "wc -l /landing/tsel/higt_trans/loena_loan_record/LOAN_RECORD_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL GABUNGAN LOAN RECORD PROD 5 dan 6="$1}' 2>/dev/null)

# LOAN RECORD SNAPSHOT
echo "CHECKING LOAN RECORD SNAPSHOT..."
total_loan_record_snapshot=$(ssh -q -t apps@prod6 ssh -q -t birefusr@10.54.3.206 "cat /landing/tsel/higt_trans/loena_loan_record_daily_snapshot/LOAN_RECORD_SNAPSHOT_${yesterday}_PAPP7.ctl 2> /dev/null" | awk -F "|" '{print "LOAN RECORD SNAPSHOT="$2}' 2>/dev/null)

# 2. PAYMENT RECORD
# PROD 5
echo "CALCULATING DAILY PAYMENT RECORD PROD5..."
total_payment_record_prod5=$(ssh -q -t apps@prod5 "wc -l /apps/loena2/reporting/PAYMENT_${yesterday}_*_PAPP5.log" | tail -n 1 | awk '{print "TOTAL PAYMENT RECORD PROD 5="$1}' 2>/dev/null)

# PROD 6
echo "CALCULATING DAILY PAYMENT RECORD PROD6..."
total_payment_record_prod6=$(ssh -q -t apps@prod6 "wc -l /apps/loena2/reporting/PAYMENT_${yesterday}_*_PAPP6.log" | tail -n 1 | awk '{print "TOTAL PAYMENT RECORD PROD 6="$1}' 2>/dev/null)

# GABUNGAN PAYMENT RECORD 5 & 6
echo "CALCULATING THE TOTAL PAYMENT RECORD..."
total_payment_record_prod5_6=$(ssh -q -t apps@prod6 ssh birefusr@10.54.3.206 "wc -l /landing/tsel/higt_trans/loena_payment/PAYMENT_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL GABUNGAN PAYMENT RECORD PROD 5 dan 6="$1}' 2>/dev/null)

# PAYMENT RECORD SNAPSHOT
total_payment_record_snapshot=$(ssh -q -t apps@prod6 ssh -q -t birefusr@10.54.3.206 "cat /landing/tsel/higt_trans/loena_payment_record_daily_snapshot/PAYMENT_RECORD_SNAPSHOT_${yesterday}_PAPP7.ctl" | awk -F "|" '{print "PAYMENT RECORD SNAPSHOT="$2}' 2>/dev/null)

# 3. PAYMENT REMINDER
# PROD 13
echo "CALCULATING DAILY PAYMENT REMINDER PROD13..."
total_payment_reminder_prod13=$(ssh -q -t apps@prod13 "wc -l /apps/loena2/logs/backend/be_rp/*/PAYMENT_REMINDER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL PAYMENT REMINDER PROD 5="$1}' 2>/dev/null)

# PROD 14
echo "CALCULATING DAILY PAYMENT REMINDER PROD14..."
total_payment_reminder_prod14=$(ssh -q -t apps@prod14 "wc -l /apps/loena2/logs/backend/be_rp/*/PAYMENT_REMINDER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL PAYMENT REMINDER PROD 6="$1}' 2>/dev/null)

# GABUNGAN PAYMENT REMINDER 13 & 14
echo "CALCULATING THE TOTAL PAYMENT REMINDER RECORD..."
total_payment_reminder_prod13_14=$(ssh -q -t apps@prod6 ssh birefusr@10.54.3.206 "wc -l /landing/tsel/higt_trans/loena_payment_reminder/PAYMENT_REMINDER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL GABUNGAN PAYMENT REMINDER PROD 13 dan 14="$1}' 2>/dev/null)

# 4. LEDGER
# PROD 5
echo "CALCULATING DAILY LEDGER PROD9..."
total_ledger_prod9=$(ssh -q -t apps@prod9 "wc -l /apps/loena2/logs/backend/be_ledger/*/LEDGER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL LEDGER PROD 9="$1}' 2>/dev/null)

# PROD 6
echo "CALCULATING DAILY LEDGER PROD10..."
total_ledger_prod10=$(ssh -q -t apps@prod10 "wc -l /apps/loena2/logs/backend/be_ledger/*/LEDGER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL LEDGER PROD 10="$1}' 2>/dev/null)

# GABUNGAN LEDGER 5 & 6
echo "CALCULATING THE TOTAL LEDGER..."
total_ledger_prod9_10=$(ssh -q -t apps@prod6 ssh birefusr@10.54.3.206 "wc -l /landing/tsel/higt_trans/loena_ledger/LEDGER_${yesterday}_*.log" | tail -n 1 | awk '{print "TOTAL GABUNGAN LEDGER 9 dan 10="$1}' 2>/dev/null)

# LEDGER SNAPSHOT
total_ledger_snapshot=$(ssh -q -t apps@prod6 ssh -q -t birefusr@10.54.3.206 "cat /landing/tsel/higt_trans/loena_ledger_daily_snapshot/LEDGER_SNAPSHOT_${yesterday}_PAPP9.ctl 2> /dev/null" | awk -F "|" '{print "LEDGER SNAPSHOT="$2}' 2>/dev/null)

# 1. LOAN RECORDS
echo "Date: $last_day"
echo "$total_loan_record_prod5"
echo "$total_loan_record_prod6"
echo "$total_loan_record_prod5_6"
echo "$total_loan_record_snapshot"
echo "========================================================"
# 2. PAYMENT RECORDS
echo "$total_payment_record_prod5"
echo "$total_payment_record_prod6"
echo "$total_payment_record_prod5_6"
echo "$total_payment_record_snapshot"
echo "========================================================"
# 3. PAYMENT REMINDER
echo "$total_payment_reminder_prod13"
echo "$total_payment_reminder_prod14"
echo "$total_payment_reminder_prod13_14"
echo "========================================================"
# 4. LEDGER
echo "$total_ledger_prod9"
echo "$total_ledger_prod10"
echo "$total_ledger_prod9_10"
echo "$total_ledger_snapshot"
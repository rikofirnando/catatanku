#!/bin/bash

echo "Simulation Churn."
read -p "Masukan MSISDN yang akan disimulasikan Churn: (Contoh: Diawali dengan 62, 6281234567890) " msisdn

# Variables of Date and Time
current_date=$(date "+%Y-%m-%d %T")
date_now_v1=$(date '+%Y%m%d')
date_now_v2=$(date '+%Y-%m-%d')
day_ago=$(date --date="day ago" +%Y-%m-%d)

# Show Current Date
echo "Date Now: $current_date"

# Create new file Churn_{date_now}.txt
echo "msisdn|activation_date|deactivation_date" > Churn_$date_now_v1.txt
echo "$msisdn|$day_ago|$date_now_v2" >> Churn_$date_now_v1.txt
# Create new file Churn_{date_now}.txt
echo "Churn_$date_now_v1.txt|1" > Churn_$date_now_v1.ctl
# Show whether the file has been created or not
ls -lrt Churn_$date_now_v1.txt Churn_$date_now_v1.ctl
# Show messages here
echo "Done!"
echo "You have completed the Churn simulation. Please check the TDR and Debug logs."
echo "                                                "
echo "Debug log can be found at /apps/loena2/logs/backend/be_pt_churn/0/debug.log"
echo "TDR log can be found at /apps/loena2/logs/backend/be_pt_churn/0/CHURN_FILE.log"

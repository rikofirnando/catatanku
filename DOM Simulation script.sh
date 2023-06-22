#!/bin/bash

echo "Simulation DOM."
echo "Untuk melakukan simulasi DOM ini harap nomor tersebut memiliki hutang/outstanding jika belum ada, maka harap ambil Loan terlebih dahulu."
read -p "Masukan MSISDN yang akan disimulasikan DOM (Contoh: Diawali dengan 62, 6281234567890): " msisdn
echo "Note: REF_TRANSACTION_ID ini di dapatkan dari ketika ambil Loan, kemudian response di copy dan di paste disini..."
read -p "Masukan REF_TRANSACTION_ID (Contoh: f0ffffff0000000000042203079987412): " rev_trxid
echo "Note: LOAN_BID ini bisa di dapatkan ketika hit Loan menggunakan skrip atau dapat dilihat melalui skrip curl pada bagian offer_id"
read -p "Masukan LOAN_BID (Contoh: 00047401/00031119/00027468/00015897/dst): " loan_bid

# Variables of Date and Time
current_date=$(date "+%Y-%m-%d %T")
date_now_v1=$(date '+%Y%m%d%H')

# Show Current Date
echo "Date Now: $current_date"

# Create new file DOM_LOENA_{date_now}.txt
echo "DEACTIVATION_TIME|MSISDN|REF_TRANSACTION_ID|LOAN_BID" > DOM_LOENA_$date_now_v1.txt
echo "$current_date|$msisdn|$rev_trxid|$loan_bid" >> DOM_LOENA_$date_now_v1.txt
# Create new file DOM_LOENA_{date_now}.txt
echo "DOM_LOENA_$date_now_v1.txt|1" > DOM_LOENA_$date_now_v1.ctl
# Show whether the file has been created or not
ls -lrt DOM_LOENA_$date_now_v1.txt DOM_LOENA_$date_now_v1.ctl
# Show messages here
echo "Done!"
echo "You have completed the DOM simulation. Please check the TDR and Debug logs."
echo "                                                "
echo "Debug log can be found at /apps/loena2/logs/backend/be_pt_dom/0/debug.log"
echo "TDR log can be found at /apps/loena2/logs/backend/be_pt_dom/0/DOM_FILE.log"
echo "Please recheck the Loena_Profile, Loena_Loan_Record, Loena_Payment_Record, dan Ledger table to determine if it has been updated."

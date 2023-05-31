#!/bin/bash

echo "Insert Whitelist ke table CREDIT_SCORING."
read -p "Masukan MSISDN yang akan ditambahkan Whitelist (Contoh: Diawali dengan 62, 6281234567890): " msisdn
read -p "Masukan Customer ID (Contoh: Masukan dalam angaka 1/10/100/123/321/555, dst): " customer_id
read -p "Masukan LOENA_QUEUE_RECTIFY0-9 (Contoh: Masukan dalam angka 0-9): " loena_queue_rectify

date_time_now=$(date +"%Y-%m-%d %H:%M:%S.%9N")

sqlplus 'LOENA/loena#2021'@'(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = 10.37.191.2)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = ODLOENA.telkomsel.co.id)))' <<EOF

-- Set format column
column remaining_loan format 999999999
column customer_id format 999999999
column exposure format 999999999
column outstanding format 999999999
column value format 999999999
column loan_value format 999999999
column paid_amount format 999999999
column is_active format 99
column status_to_loan format 99
column maximum_sequence format 99
column curr_sequence format 99
column mode format 99
column id format 99
column last_id_loan format a15
column last_id_loan format a25
column incremental format 99
column status format 999
column type format a4
column bid format a10
column create_date format a10
column channel_id format a11
column msisdn format a15
column trxid format a35
column campaign_id format a20
column state format a20
column campaign_id format a20
column create_time format a30
column due_date format a30
column channel_trxid format a35
column created_at format a30
column updated_at format a30
column churn_date format a30
column transaction_id format a35
column provisioning_id format a35
column payload format a50
column source format a50
set linesize 3000

-- Run this queries
INSERT INTO "LOENA"."LOENA_QUEUE_RECTIFY${loena_queue_rectify}" (CUSTOMER_ID, MSISDN, META_DATA, STATUS, CREATE_TIME) VALUES ('$customer_id', '$msisdn', '(null)', '1', TO_TIMESTAMP('$date_time_now', 'YYYY-MM-DD HH24:MI:SS.FF'));
SELECT * FROM "LOENA"."LOENA_QUEUE_RECTIFY${loena_queue_rectify}"

-- Exit from SQL Plus
exit;
EOF

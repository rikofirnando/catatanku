#!/bin/bash

read -p "Masukan Tahun (Contoh: Masukan dalam bentuk angka 2021,2022,2023, dst): " year
read -p "Masukan Bulan (Contoh: Masukan dalam bentuk angka bulan 1-12): " month
read -p "Masukan Hari (Contoh: Masukan dalam bentuk angka hari 1-31): " day

echo "                "
echo "HASIL COUNT & SUM LOAN & PAYMENT RECORD TABLES: "
echo "1. Data Loan Record Table"
echo "2. Data Payment Record TAble"

sqlplus 'LOENA/LOENA#exa82bsd2021'@'(DESCRIPTION=(FAILOVER=on)(LOAD_BALANCE =off)(CONNECT_TIMEOUT=2)(RETRY_COUNT=2)(RETRY_DELAY=2)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=exa82absdp-scan1)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=exa82atbsp-scan1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=haloena)))' 2> /dev/null << EOF

-- Loan Record Table
-- COUNT & SUM(value)
SELECT COUNT(*) as COUNT, SUM(value) as SUM FROM loan_record WHERE EXTRACT(YEAR FROM created_at) = $year AND EXTRACT(MONTH FROM created_at) = $month AND EXTRACT(DAY FROM created_at) = $day;
-- Payment Record Table
-- COUNT & SUM(value)
SELECT COUNT(*) as COUNT, SUM(value) as SUM FROM payment_record WHERE EXTRACT(YEAR FROM created_at) = $year AND EXTRACT(MONTH FROM created_at) = $month AND EXTRACT(DAY FROM created_at) = $day;

exit;
EOF

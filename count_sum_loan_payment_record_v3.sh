#!/bin/bash

read -p "Masukkan Hari-Bulan-Tahun (Contoh: 08-JUN-23, 01-JUL-23, dst): " ddmmyy

echo "                "
echo "HASIL COUNT & SUM LOAN & PAYMENT RECORD TABLES: "
echo "1. Data Loan Record Table"
echo "2. Data Payment Record Table"

output=$(sqlplus -s 'LOENA/LOENA#exa82bsd2021'@'(DESCRIPTION=(FAILOVER=on)(LOAD_BALANCE=off)(CONNECT_TIMEOUT=2)(RETRY_COUNT=2)(RETRY_DELAY=2)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=exa82absdp-scan1)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=exa82atbsp-scan1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=haloena)))' 2>/dev/null <<EOF
SET PAGESIZE 0
SET FEEDBACK OFF
SET VERIFY OFF
SET HEADING OFF

-- Loan Record Table
-- COUNT & SUM(value)

select count(*) as COUNT, sum(value) as SUM from LOAN_RECORD where substr("CREATED_AT",1,9)='$ddmmyy';

-- Payment Record Table
-- COUNT & SUM(value)
select count(*) as COUNT, sum(value) as SUM from PAYMENT_RECORD where substr("CREATED_AT",1,9)='$ddmmyy';

exit;
EOF
)

echo "$output"


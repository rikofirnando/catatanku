#!/bin/bash

# Current Date & Time
current_date=$(date "+%Y-%m-%d %T")
echo -e "DATE NOW:\n$current_date"

echo "HASIL COUNT & SUM LOAN_PAYMENT_HISTORY:"

# Array
tables=("loan_payment_history")

for table in "${tables[@]}"; do
    result=$(/apps/mysql/mysql-comm-8.0.22/bin/mysql -h10.59.100.34 -P3448 -u loena loenadb -pB3rsAMaL0eN4#2021 -e "select count(*), sum(value) from $table;" 2>/dev/null)
    count_tables=$(echo "$result" | awk 'NR==2')
    echo "TOTAL $table: $count_tables"

done

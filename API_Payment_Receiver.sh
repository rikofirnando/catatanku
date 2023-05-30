#!/bin/bash

echo "API Payment Receiver"
read -p "Masukkan MSISDN (Contoh: Diawali dengan 62 bukan 0, 6281234567890): " msisdn
read -p "Masukan Channel Transaction ID: (Contoh: PAYRECEIVER0000/PAYRECEIVER0001/PAYRECEIVER0002): " channel_trxid
read -p "Masukan Channel Name (Contoh: pb/f0/h1): "

current_date_time=$(date +"%Y%m%d%H%M%S")

authorization=$(printf '%s' "${msisdn}${channel_trxid}" | sha256sum | cut -f1 -d' ' | base64 -w 0 | sed 's/o=/==/g')
curl -vk "https://10.49.141.144:9002/loena/v2/payment" \
--header "Authorization: $authorization" \
--header 'Content-Type: application/json' \
--data "{
"channel_transaction_id" : "$channel_trxid",
"msisdn" : "$msisdn",
"channel_name" : "$channel_name"
}"

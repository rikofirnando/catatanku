#!/bin/bash

read -p "Masukan MSISDN dan TRXID (Contoh: 628123456789TES123/6281287037944TESLOAN321/6281287037945TAKELOAN001/dst): " msisdn_trx_id

authorization=$(printf '%s' "${msisdn_trx_id}" | sha256sum | cut -f1 -d' ' | base64 -w 0 | sed 's/o=/==/g')

echo -e "Authorization Results for "${msisdn}${trx_id}":\n$authorization"

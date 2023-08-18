#!/bin/bash

if [ $# -lt 2 ]
then
  echo "No arguments supplied, required: <msisdn> <trxid>"
  exit 1
fi

msisdn=$1
trx_id=$2
msisdn_trx_id="${msisdn}${trx_id}"

authorization=$(echo -n "$msisdn_trx_id" | sha256sum | cut -f1 -d' ' | base64 -w 0 | sed 's/o=/==/g')

echo -e "Authorization Results for ${msisdn}${trx_id}:\n$authorization"

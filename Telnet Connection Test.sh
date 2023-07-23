#!/bin/bash

echo "Telnet Connection Test."
echo "Note: Dapat melakukan tes secara multiple atau lebih dari satu IP atau Port. Jika ingin melakukan hanya single IP & Port juga bisa dilakukan."
read -p "Masukkan daftar IP Address yang akan diuji koneksi Telnet: (Contoh: Dipisahkan dengan spasi 10.49.3.201 10.49.3.202 10.49.3.197): " ip_address_list
read -p "Masukkan daftar port yang akan diuji koneksi Telnet: (Contoh: Dipisahkan dengan spasi 6201 6202 13000 13001 14000 14001): " port_list

current_date=$(date +"%Y-%m-%d %H:%M:%S")

echo "                "
echo "Date Now: $current_date"
for ip in $ip_address_list; do
  for port in $(echo $port_list | tr '/' ' '); do
    output=$(echo quit | telnet $ip $port 2>&1)
    if echo "$output" | grep -q "Connected"; then
      echo "Successful Connected: $ip:$port"
    else
      echo "Connection Failed or Connection Timed Out: $ip:$port"
    fi
  done
done

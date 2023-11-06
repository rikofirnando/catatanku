#!/bin/bash

read -p "Masukkan jumlah hari mundur: " days

if [[ ! $days =~ ^[0-9]+$ ]]; then
  echo "Masukkan harus berupa angka bulat positif."
  exit 1
fi

tanggal_mundur=$(date -d "$days days ago" "+%Y-%m-%d")
echo "Tanggal mundur $days hari dari hari ini adalah: $tanggal_mundur"

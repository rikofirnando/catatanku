#!/bin/bash

read -p "Masukkan jumlah hari: " days

if [[ ! $days =~ ^[0-9]+$ ]]; then
  echo "Masukkan harus berupa angka bulat positif."
  exit 1
fi

read -p "Apakah Anda ingin menghitung hari maju atau hari mundur? (maju/mundur): " choice

if [ "$choice" == "maju" ]; then
  tanggal_maju=$(date -d "$days days" "+%Y-%m-%d")
  echo "Tanggal maju $days hari dari hari ini adalah: $tanggal_maju"
elif [ "$choice" == "mundur" ]; then
  tanggal_mundur=$(date -d "$days days ago" "+%Y-%m-%d")
  echo "Tanggal mundur $days hari dari hari ini adalah: $tanggal_mundur"
else
  echo "Pilihan tidak valid. Harap masukkan 'maju' atau 'mundur'."
  exit 1
fi

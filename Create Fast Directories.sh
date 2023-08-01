#!/bin/bash

# Array name of months
bulan=("Januari" "Februari" "Maret" "April" "Mei" "Juni" "Juli" "Agustus" "September" "Oktober" "November" "Desember")

# Loop untuk membuat direktori
for ((i=0; i<12; i++)); do
    mkdir "${bulan[i]}"
done

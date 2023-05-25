#!/bin/bash

echo "Silahkan masukkan nomor PID (pisahkan dengan spasi jika multiple PID):"
read -a pids

for pid in "${pids[@]}"
do
    kill -9 $pid
    echo "Service dengan nomor PID $pid telah dihentikan."
done

#!/bin/bash

echo "Silahkan masukkan nomor PID (pisahkan dengan spasi jika multiple PID):"
read -a pids

for pid in "${pids[@]}"
do
    pwdx $pid
    echo "Path Service dari $pid ."
done

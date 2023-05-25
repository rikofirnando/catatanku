#!/bin/bash

echo "Silahkan masukkan nomor PID:"
read pid

kill -9 $pid
echo "Service dengan nomor PID $pid telah dihentikan."

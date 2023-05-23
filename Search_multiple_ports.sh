#!/bin/bash

ports=("$@") # Mengambil semua argumen sebagai array port

if [ ${#ports[@]} -eq 0 ]; then
  echo "Usage: $0 <port1> <port2> ..."
  exit 1
fi

for port in "${ports[@]}"; do
  netstat -tuln | grep "$port"
done

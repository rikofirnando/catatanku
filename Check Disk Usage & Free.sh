#!/bin/bash

current_date=$(date "+%Y-%m-%d %T")

if [ $# -eq 0 ]; then
  echo "Please input the directory for which you want to check the storage usage status."
  echo "Follow this example (e.g., add the directory after: /data/, /tmp/, /home/apps/, /home/apps/loena2, /apps/*, etc.)"
  exit 1
fi

check_directory=$1

if [ ! -d "$check_directory" ]; then
  echo "Directory not found. Please try again and ensure the directory is present."
  exit 1
fi

get_storage_usage_percentage() {
  total_percentage=$(df -h $check_directory | awk 'NR==2 {print $5}' | awk -F "%" '{print $1}')
  echo $total_percentage
}

storage_free=$(df -hTP "$check_directory" 2>/dev/null)
storage_usage=$(du -sh "$check_directory" 2>/dev/null)
whole_storage=$(df -hTP)
result=$(get_storage_usage_percentage)

echo "Date Now: $current_date"
echo "Storage usage of $check_directory in percentage: $result% "
echo "$storage_free"
echo "              "
echo "Storage free is: $storage_usage"
echo "              "
echo "Display the total storage in each mounted directory."
echo "$whole_storage"


#!/bin/bash

# Current Date.
current_date=$(date "+%Y-%m-%d %T")

# The directory to be monitored.
target_directory="/data/"

# Percentage of the minimum storage limit prior to archiving.
threshold_percentage=75

# Function to archive .log files with gzip
archive_logs() {
  find "$1" \( -name "*.log" -o -name "*.txt" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -prune | xargs gzip -v
}

# Function to retrieve the percentage of storage usage in the directory.
get_storage_usage_percentage() {
  total_percentage=$(df -h $1 | awk 'NR==2 {print $5}' | awk -F "%" '{print $1}')
  echo $total_percentage
}

# Result Before storage usage percentage
current_percentage_before=$(get_storage_usage_percentage "$target_directory")

# Displays human-readable storage status prior to archive execution.
get_storage_usage_before=$(df -ah "$target_directory")

# Displays human-unreadable storage status prior to archive execution.
get_storage_usage_before_v2=$(df -P "$target_directory" | awk 'NR==2 {print "Storage Used in KiloByte(s):", $3}')

# Check the percentage of storage usage prior to execution.
if [ "$current_percentage_before" -gt "$threshold_percentage" ]; then
  echo "Storage usage percentage: $current_percentage_before%"
  echo "Storage usage is above or more than ${threshold_percentage}%. Archiving *.log and/or *.txt files..."
  archive_logs "$target_directory"
  echo "The archiving process is completed."
else
  echo "Storage usage percentage: $current_percentage_before%"
  echo "Storage usage is below or less than ${threshold_percentage}%. Tidak perlu pengarsipan."
fi

# Get the storage usage after archiving.
current_percentage_after=$(get_storage_usage_percentage "$target_directory")
current_percentage_after_v2=$(df -P "$target_directory" | awk 'NR==2 {print "Storage Used in KiloByte(s):", $3}')

# Displays date and time, along with storage status, after archive execution.
echo "                       "
echo "Date Now: $current_date"
echo "Storage status"
echo "A. Human Unreadable"
echo "1. Before archiving: "
echo "${get_storage_usage_before_v2} KB = $current_percentage_before%"
echo "2. After archiving: "
echo "${current_percentage_after_v2} KB = $current_percentage_after%"
echo "                       "
echo "B. Human Readable"
echo "1. Before archiving: "
echo "$get_storage_usage_before"
echo "2. After archiving: "
echo "$(df -ah "$target_directory")"


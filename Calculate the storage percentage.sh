get_storage_usage_percentage() {
  used=$(df -P /data/ | awk 'NR==2 {print $3}')
  total=$(df -P /data/ | awk 'NR==2 {print $2}')
  percentage=$((used * 100 / total))
  echo $percentage
}

result=$(get_storage_usage_percentage)
echo "Storage usage percentage: $result%"

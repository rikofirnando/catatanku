#!/bin/bash

echo "How many days ago do you want to input? (e.g. 2, 3, 4, 5) day ago"
read days_ago

# Variables
yesterday=$(date --date="$days_ago day ago" +%Y%m%d)

    echo "Please wait while getting your data! "
for i in {5..6}; do
    scp prod$i:/tmp/server*_${yesterday}.csv /home/trisun/bihandler/ 2>/dev/null
done

echo "Done"

find /data/ -name "*.log" -not -name "*.log.gz" -exec gzip -v {} \;
find /data/ -name "*.log" -print -o -name "*.log.gz" -prune | xargs gzip -v
find /data/ \( -name "*.log" -o -name "*.txt" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -prune | xargs gzip -v

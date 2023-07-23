find /data/ -name "*.log" -not -name "*.log.gz" -exec gzip -v {} \;
find /data/ -name "*.log" -print -o -name "*.log.gz" -prune | xargs gzip -v
find /data/ \( -name "*.log" -o -name "*.txt" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -prune | xargs gzip -v
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -o \( -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -prune | xargs gzip -v
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" -o -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -print | grep -v -E "LEDGER_SNAPSHOT_.*\.(log|ctl)$" | xargs gzip -v
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" -o -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -print | grep -v -E "LEDGER_SNAPSHOT_.*\.(log|ctl)$" | xargs gzip -v

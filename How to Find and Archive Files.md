1. Mencari file dengan karakter atau kata yang sensitif
```bash
find "/data/" -type f -name 'LedGer_SnapShot_*.log'
find "/data/" -type f -name 'LEDGER_SNAPSHOT_*.log'
```
2. Mencari file dengan karakter atau kata yang sensitif
find "/data/" -type f -iname 'LedGer_SnapShot_*.log'
find "/data/" -type f -iname 'LEDGER_SNAPSHOT_*.log'


find "/data/" -type f ! -name 'LEDGER_SNAPSHOT_*.log'
find "/data/" -type f ! -iname 'LEDGER_SNAPSHOT_*.log'

find /data/ -name "*.log" -not -name "*.log.gz" -exec gzip -v {} \;

find /data/ -name "*.log" -print -o -name "*.log.gz" -prune | xargs gzip -v

find /data/ \( -name "*.log" -o -name "*.txt" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -prune | xargs gzip -v

find /data/ \( -iname "*.log" -o -iname "*.txt" -o -iname "*.ctl" -o -iname "*.ilog.gz" -o -iname "*.txt.gz" \) ! -iname "LEDGER_SNAPSHOT_*.log*" ! -iname "LEDGER_SNAPSHOT_*.ctl*" -print | xargs gzip -v

find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -o \( -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -prune | xargs gzip -v

find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" -o -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -print | grep -v -E "LEDGER_SNAPSHOT_.*\.(log|ctl)$" | xargs gzip -v

find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" \) ! -name "LEDGER_SNAPSHOT_*.log" ! -name "LEDGER_SNAPSHOT_*.ctl" -print | xargs gzip -v


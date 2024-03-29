# Find the files in the archive
## A. Regular File Only
## Case Sensitive
1. Mencari file dengan karakter atau kata yang sensitif dan tambahan opsi hanya mencari regular file
```bash
find "/data/" -type f -name 'LedGer_SnapShot_*.log'
find /data/ -type f -name 'LedGer_SnapShot_*.log'
```
```bash
find "/data/" -type f -name 'LEDGER_SNAPSHOT_*.log'
find /data/ -type f -name 'LEDGER_SNAPSHOT_*.log'
```
## Incase Sensitive
2. Mencari file dengan karakter atau kata yang sensitif dan tambahan opsi hanya mencari regular file
```bash
find "/data/" -type f -iname 'LedGer_SnapShot_*.log'
find /data/ -type f -iname 'LedGer_SnapShot_*.log'
```
```bash
find "/data/" -type f -iname 'LEDGER_SNAPSHOT_*.log'
find /data/ -type f -iname 'LEDGER_SNAPSHOT_*.log'
```
find "/" -iname 'LOENA_CAMPAIGN_TRACKING_SNAPSHOT' -o -iname 'LOENA_LEDGER' -o -iname 'LOENA_OFFER_VALIDATION' -o -iname 'LOENA_PAYMENT_REMINDER' -o -iname 'LOENA_PULL_OFFER' -o -iname 'LOENA_PUSH_OFFER' -o -iname 'LOENA_FULFILLMENT'

```
find /data/ -type f -exec du -h {} + | sort -rh
find /data/ -type f -exec du -h {} + | sort -rh | head -n 100
find /data/ -type f -exec du -h {} + | sort -rh | tail -n 100
find . -type f -print0 | xargs -0 du -s | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}
df -ah /data/
```

```
find /data/ -type f -exec stat --format="%y %W %n" {} + | sort -rnk2 | head -n 100
```
```
find "/data/" -type f -iname 'LEDGER_SNAPSHOT_*.log' -ctime -1 
```
```
find /data/ -name "*.log" -not -name "*.log.gz" -exec gzip -v {} \;
```
```
find /data/ -name "*.log" -print -o -name "*.log.gz" -prune | xargs gzip -v
```
```
find /data/ \( -name "*.log" -o -name "*.txt" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -prune | xargs gzip -v
```
```
find /data/ \( -iname "*.log" -o -iname "*.txt" -o -iname "*.ctl" -o -iname "*.ilog.gz" -o -iname "*.txt.gz" \) ! -iname "LEDGER_SNAPSHOT_*.log*" ! -iname "LEDGER_SNAPSHOT_*.ctl*" -print | xargs gzip -v
```
```
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" \) -print -o \( -name "*.log.gz" -o -name "*.txt.gz" \) -o \( -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -prune | xargs gzip -v
```
```
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" -o -name "LEDGER_SNAPSHOT_*.log" -o -name "LEDGER_SNAPSHOT_*.ctl" \) -print | grep -v -E "LEDGER_SNAPSHOT_.*\.(log|ctl)$" | xargs gzip -v
```
```
find /data/ \( -name "*.log" -o -name "*.txt" -o -name "*.ctl" -o -name "*.log.gz" -o -name "*.txt.gz" \) ! -name "LEDGER_SNAPSHOT_*.log" ! -name "LEDGER_SNAPSHOT_*.ctl" -print | xargs gzip -v
```
```
find "/data/" -type f -exec du -h {} + | sort -rh | head -n 50
```

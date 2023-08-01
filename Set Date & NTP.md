Atur tanggal "1 Agustus 2023 pukul 13:55:00" 
Format:
date [MMDDhhmmCCYY.ss]
```bash
date 080113552023.00
```
Atur timezone "Asia/Jakarta"
```bash
timedatectl set-timezone Asia/Jakarta
```
Pasang NTP Client ke Server
```bash
apt install ntp
apt install ntpdate
```
Atur NTP Client ke Server
```bash
ntpdate id.pool.ntp.org
```

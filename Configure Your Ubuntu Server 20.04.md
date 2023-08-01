# 1. Update and Upgrade Your Repositories
```bash
apt udpate && apt upgrade
```
# 2. If you have faced the problem while you are installing the package, do this. 
## SKIP THESE STEPS IF YOU DIDN'T HAVE FACED THIS ISSUES!! THESE ARE OPTIONAL STEPS
```bash
apt-get update --fix-missing
```
## Change the repository to the nearest your country
```bash
nano /etc/apt/sources.list
```
Edit inside of this file:
Add these repositories
# a. Kambing UI
deb http://kambing.ui.ac.id/debian/ bullseye main contrib non-free
deb http://kambing.ui.ac.id/debian/ bullseye-updates main contrib non-free
deb http://kambing.ui.ac.id/debian-security/ bullseye/updates main contrib non-free
# b. Kebo VLSM
deb http://kebo.vlsm.org/debian/ bullseye main contrib non-free
deb http://kebo.vlsm.org/debian/ bullseye-updates main contrib non-free
deb http://kebo.vlsm.org/debian-security/ bullseye/updates main contrib non-free
# c. Data Utama Surabaya
deb http://kartolo.sby.datautama.net.id/debian/ bullseye main contrib non-free
deb http://kartolo.sby.datautama.net.id/debian/ bullseye-updates main contrib non-free
deb http://kartolo.sby.datautama.net.id/debian-security/ bullseye/updates main contrib non-free
# d. Mirror Unej
deb http://mirror.unej.ac.id/debian/ bullseye main contrib non-free
deb http://mirror.unej.ac.id/debian/ bullseye-updates main contrib non-free
deb http://mirror.unej.ac.id/debian-security/ bullseye/updates main contrib non-free
# e. Kebo PENS
deb http://kebo.pens.ac.id/ubuntu/ jammy main restricted universe multiverse
deb http://kebo.pens.ac.id/ubuntu/ jammy-updates main restricted universe multiverse
deb http://kebo.pens.ac.id/ubuntu/ jammy-security main restricted universe multiverse
deb http://kebo.pens.ac.id/ubuntu/ jammy-backports main restricted universe multiverse
deb http://kebo.pens.ac.id/ubuntu/ jammy-proposed main restricted universe multiverse

# Install SSH

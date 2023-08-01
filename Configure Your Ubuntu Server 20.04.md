# 1. Update and Upgrade Your Repositories after installing your Ubuntu Server.
```bash
apt-get update && apt upgrade
apt update && apt upgrade
apt update;apt upgrade
```
# If you have faced the problem while you are installing the package, do this. 
## SKIP THESE STEPS IF YOU DIDN'T HAVE FACED THIS ISSUES!! THESE ARE OPTIONAL STEPS
```bash
apt-get update --fix-missing
```
## Or you can hange your repositories to the nearest your country
Edit inside of this file:
```bash
nano /etc/apt/sources.list
```
E.G:
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

## Then, update and upgrade again
```bash
apt-get update && apt upgrade
apt update && apt upgrade
apt update;apt upgrade
```

# 2. Set Network (Netplan)
Edit this file:
```bash
nano /etc/netplan/00-installer-config.yaml
vi /etc/netplan/00-installer-config.yaml
```
E.G Based on Your Network:
a. Server 1 (Cilestri-1)
```
# This is the network config written by 'subiquity'
network:
  version: 2
  ethernets:
    eth0@if22:
      addresses: [192.168.10.27/24]
      nameservers:
         addresses:
         - 192.168.10.27            # Domain: ns.cilestri.id
         - 8.8.8.8                  # First Google DNS
         - 8.8.4.4                  # Second Google DNS
         search: [ ns1.cilestri.id ] # First DNS Zone
         search: [ ns2.cilestri.id ] # Second DNS Zone
```
b. Server 2 (Cilestri-2)
```
# This is the network config written by 'subiquity'
network:
  version: 2
  ethernets:
    eth0@if22:
      addresses: [192.168.10.28/24]
      nameservers:
         addresses:
         - 192.168.10.28            # Domain: ns.cilestri.id
         - 8.8.8.8                  # First Google DNS
         - 8.8.4.4                  # Second Google DNS
         search: [ ns1.cilestri.id ] # First DNS Zone
         search: [ ns2.cilestri.id ] # Second DNS Zone
```
c. Server 3 (Cilestri-3)
```
# This is the network config written by 'subiquity'
network:
  version: 2
  ethernets:
    eth0@if22:
      addresses: [192.168.10.29/24]
      nameservers:
         addresses:
         - 192.168.10.29            # Domain: ns.cilestri.id
         - 8.8.8.8                  # First Google DNS
         - 8.8.4.4                  # Second Google DNS
         search: [ ns1.cilestri.id ] # First DNS Zone
         search: [ ns2.cilestri.id ] # Second DNS Zone
```
Terapkan konfigurasi netplan
```bash
netplan try
```
Or you can apply your netplan configuration directly.
```bash
netplan apply
```

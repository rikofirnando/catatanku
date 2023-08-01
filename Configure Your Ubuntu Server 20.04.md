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

# 2. Set Your Network Configuration to be IP Static (Netplan)
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
# 3. Configure Your Hosts File
Edit the Hosts file:
```bash
nano /etc/hosts
vi /etc/hosts
```
E.G:
Apply for Server 1, 2, and 3
```
192.168.10.27 cilestri-1.cilestri.id cilestri-1
192.168.10.28 cilestri-2.cilestri.id cilestri-2
192.168.10.29 cilestri-3.cilestri.id cilestri-3
```
Optional:
```
127.0.1.1 cilestri-2.cilestri.id cilestri-2
```
# 4. Configure your Hostname file
a. Server 1
```bash
hostnamectl cilestri-1
```
b. Server 2
```bash
hostnamectl cilestri-2
```
c. Server 3
```bash
hostnamectl cilestri-3
```
Or you can do this way
Edit the Hostname file:
```bash
nano /etc/hostname
vi /etc/hostname
```
Apply for Server 1, 2, and 3.
E.G:
```
cilestri-1
cilestri-2
cilestri-3
```
# 5. Set Resolv.conf file
a. Install Resolvconf to set DNS permanently
```bash
apt install resolvconf
```
b. Enable, Start and Check the Resolvconf service
```
systemctl enable resolvconf
systemctl start resolvconf
systemctl status resolvconf
```
c. Edit this file:
```bash
nano /etc/resolvconf/resolv.conf.d/head
vi /etc/resolvconf/resolv.conf.d/head
```
E.G:
Add these scripts and apply for third servers
```
search cilestri.id
nameserver 192.168.10.28
nameserver 8.8.8.8
nameserver 8.8.4.4
```
d. Update Resolvconf
```bash
resolvconf --enable-updates
resolvconf -u
```
e. Verify your Resolv.conf file
```bash
cat /etc/resolv.conf
```
## If you have faced the problem with your name resolution, do this.
``` bash
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo "nameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
```
f. Verify your Network connection
- Ping to DNS Forward (fDNS)
```
ping google.com
ping bing.com
```
- Ping to DNS Reverse (rDNS)
```
ping 8.8.8.8
ping 8.8.4.4
```
## 6. User Management
Add new user to your server
E.G:
``` bash
adduser riko
adduser reffal
```
Don't forget to fill those Password on your users!
Or another way is
```bash
useraddd riko
passwd riko
useradd reffal
passwd ahlakiah
```


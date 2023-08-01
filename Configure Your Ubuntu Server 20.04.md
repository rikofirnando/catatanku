# 1. Update and Upgrade Your Repositories after installing your Ubuntu Server.
```bash
apt-get update && apt upgrade
apt update && apt upgrade
apt update;apt upgrade
```
# If you have faced the problem while you are installing the package, do this. 
## SKIP THESE STEPS IF YOU DON'T FACE THIS ISSUES!! THESE ARE OPTIONAL STEPS
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
nano /etc/netplan/00-installer-config.yaml --linenumbers
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
nano /etc/resolvconf/resolv.conf.d/head --linenumbers
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
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf # If this command doesn't work you can use the second command below:
ln -sf /run/resolvconf/resolv.conf /etc/resolv.conf
# Server 1 (cilestri-1)
echo "search cilestri.id\nnameserver 192.168.10.27\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# Server 2 (cilestri-2)
echo "search cilestri.id\nnameserver 192.168.10.28\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# Server 3 (cilestri-3)
echo "search cilestri.id\nnameserver 192.168.10.29\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
cat /etc/resolv.conf
```
f. Verify your Network connection
- Ping to DNS Reverse (rDNS)
```
ping 8.8.8.8
ping 8.8.4.4
ping 1.1.1.1
ping 192.168.10.27
ping 192.168.10.28
ping 192.168.10.29
```

- Ping to DNS Forward (fDNS)
```
ping google.com
ping bing.com
ping cilestri.id
ping ns1.cilestri.id
ping ns2.cilestri.id
```

# 6. User Management
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
# 7. Install and Configure SSH Service
a. Install SSH service
```bash
apt install ssh
apt install openssh-server -y
```
b.  Edit sshd_config file:
```bash
nano /etc/ssh/sshd_config
nano /etc/ssh/sshd_config --linenumbers
vi /etc/ssh/sshd_config
```
E.G:
Note:
_"Remove this "#" to enable your configuration"_
```
Port 2023
LoginGraceTime 2m
# PermitRootLogin yes is NOT RECOMMENDED for Production but if you just want to train or practice only it prefer to enable it to remote easily and connected to "root" directly. 
PermitRootLogin yes
# I highly recommend you to keep "PermitRootLogin" is disable it "#PermitRootLogin prohibit-password" or enable but "PermitRootLogin no"
StrictModes yes
MaxAuthTries 6
MaxSessions 10
```
c. Restart SSH service
```bash
/etc/init.d/ssh restart
service ssh restart
systemctl restart ssh
```
d. Verify your SSH connection
E.G:
```
# Remote from Server 1 to 2
ssh -p 2023 root@192.168.10.28

# Remote from Server 1 to 3
ssh -p 2023 root@192.168.10.27

# Remote from Server 2 to 3
ssh -p 2023 root@192.168.10.29

# Remote from Server 2 to 1
ssh -p 2023 root@192.168.10.27

# Remote from Server 3 to 2
ssh -p 2023 root@192.168.10.28

# Remote from Server 3 to 1
ssh -p 2023 root@192.168.10.27
```
If your server doesn't set Port to another Port, by default port is 22 so you do not need to add option -p. Just like this...
E.G:
```
ssh root@192.168.10.27
ssh root@192.168.10.28
ssh root@192.168.10.29
```
e. Transfer file testing
E.G:
```
# 1. Transfer or Send file 
scp -P 2023 /tmp/file.txt root@192.168.10.27:/tmp/
scp -P 2023 /tmp/file.txt root@192.168.10.28/tmp/
scp -P 2023 /tmp/file.txt root@192.168.10.29/tmp/
# Or
scp -P 2023 file.txt root@192.168.10.27:/tmp/
scp -P 2023 file.txt root@192.168.10.28/tmp/
scp -P 2023 file.txt root@192.168.10.29/tmp/
# 2. Get file
scp -P 2023 root@192.168.10.27:/tmp/file.txt /tmp/
scp -P 2023 root@192.168.10.28/tmp/file.txt /tmp/
scp -P 2023 root@192.168.10.29/tmp/file.txt /tmp/
# Or
scp -P 2023 root@192.168.10.27:/tmp/file.txt .
scp -P 2023 root@192.168.10.28/tmp/file.txt .
scp -P 2023 root@192.168.10.29/tmp/file.txt .
```
f. Create Private and Public Key
```
ssh-keygen -t rsa

# This information will be shown
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```
- Where is the id_rsa and id_rsa.pub located? By default is this directory ~
```bash
ls ~/.ssh
```












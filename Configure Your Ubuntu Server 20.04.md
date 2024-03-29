# 1. Update and Upgrade Your Repositories after installing your Ubuntu Server.
```
apt-get update && apt upgrade
apt update && apt upgrade
apt update;apt upgrade
```
# If you have faced the problem while you are installing the package, do this. 
## SKIP THESE STEPS IF YOU DON'T FACE THIS ISSUES!! THESE ARE OPTIONAL STEPS
```
apt-get update --fix-missing
```
## Or you can hange your repositories to the nearest your country
Edit inside of this file:
```bash
nano /etc/apt/sources.list
```
E.G:
Add these repositories
```
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

# Default Repositories from Ubuntu
deb http://archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu focal-security main restricted universe multiverse
```

# Or third way
```
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
```

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
# Server 1 (cilestri-1)
search cilestri.id
nameserver 192.168.10.27
nameserver 192.168.10.28
nameserver 192.168.10.29
nameserver 8.8.8.8
nameserver 8.8.4.4

# Server 2 (cilestri-2)
search cilestri.id
nameserver 192.168.10.28
nameserver 192.168.10.27
nameserver 192.168.10.29
nameserver 8.8.8.8
nameserver 8.8.4.4

# Server 3 (cilestri-3)
search cilestri.id
nameserver 192.168.10.29
nameserver 192.168.10.27
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
echo "search cilestri.id\nnameserver 192.168.10.27\nnameserver 192.168.10.28\nnameserver 192.168.10.29\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# Server 2 (cilestri-2)
echo "search cilestri.id\nnameserver 192.168.10.28\nnameserver 192.168.10.27\nnameserver 192.168.10.29\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# Server 3 (cilestri-3)
echo "search cilestri.id\nnameserver 192.168.10.29\nnameserver 192.168.10.28\nnameserver 192.168.10.27\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# Or you can update Resolvconf
resolvconf --enable-updates
resolvconf -u
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
c. Restart and check status SSH service
- Restart SSH
```bash
/etc/init.d/ssh restart
service ssh restart
systemctl restart ssh
```
- Check SSH status
```
systemctl status ssh
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
g. Copy id_rsa.pub to other servers to remote server easily without fill the password
```
ssh-copy-id root@192.168.10.27
ssh-copy-id root@192.168.10.28
ssh-copy-id root@192.168.10.29
# Or  by adding port option
ssh-copy-id -p 2023 root@192.168.10.27
ssh-copy-id -p 2023 root@192.168.10.28
ssh-copy-id -p 2023 root@192.168.10.29
```
f. Verify your private and public keys
```
ssh root@192.168.10.27
ssh root@192.168.10.28
ssh root@192.168.10.29
# Or by adding port option
ssh root@192.168.10.27 -p 2023
ssh root@192.168.10.28 -p 2023
ssh root@192.168.10.29 -p 2023
```

# 8. Install DNS Serveer (bind9)
a. Install Bind9
```
apt install bind9 -y
```
b. Install DNS Utils
```
apt install dnsutils
```
c. Check Bind9 status
```
systemctl status bind9
```
d. Create duplicate template
e. Go to Bind directory
```
cd /etc/bind/
```
f. Create duplicate templates DNS Forward & Reverse
```bash
cp db.local db.cilestri_fwd
cp db.local db.cilestri_rvs
```
g. Edit "db.cilestri_fwd" di sisi Server 1 (cilestri-1)
```
nano db.cilestri_fwd
nano db.cilestri_fwd --linenumbers
vi db.cilestri_fwd
```
h. Edit DNS Forward like this. E.G:
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     cilestri.web. root.cilestri.web. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.cilestri.id.
@       IN      NS      ns2.cilestri.id.
@       IN      A       192.168.10.27
@       IN      MX 5    mail.cilestri.id.
@       IN      MX 5    192.168.10.27
ns1     IN      A       192.168.10.27
ns2     IN      A       192.168.10.28
www     IN      A       192.168.10.27
blog    IN      A       192.168.10.27
ftp     IN      A       192.168.10.27
mail    IN      A       192.168.10.27
monitor IN      A       192.168.10.27
```
i. Edit "db.cilestri_rvs" file di sisi Server 1 (cilestri-1)
```
nano db.cilestri_rvs
nano db.cilestri_rvs --linenumbers
vi db.cilestri_rvs
```
j. Edit DNS Reverse like this. E.G:
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     cilestri.id. root.cilestri.id. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.cilestri.id.
@       IN      NS      ns2.cilestri.id.
27      IN      PTR     ns1.cilestri.id.
28      IN      PTR     ns2.cilestri.id.
27      IN      PTR     cilestri.id.
27      IN      PTR     www.cilestri.id.
27      IN      PTR     blog.cilestri.id.
27      IN      PTR     mail.cilestri.id.
27      IN      PTR     ftp.cilestri.id.
27      IN      PTR     monitor.cilestri.id.
```
k. Edit "named.conf.local" file di sisi Server 1 (cilestri-1)
```
nano named.conf.local
nano named.conf.local --linenumbers
vi named.conf.local
```

l. Edit Zones file like this. E.G:
```
zone "cilestri.id" IN {
        type master;
        file "/etc/bind/db.cilestri_fwd";
        allow-transfer {192.168.10.28;};
};

zone "10.168.192.in-addr.arpa" IN {
    type master;
    file "/etc/bind/db.cilestri_rvs";
    allow-transfer {192.168.10.28;};
};
```
m. Edit "named.conf.options" file di sisi Server 1 (cilestri-1)
```
nano named.conf.options
nano named.conf.options --linenumbers
vi named.conf.options
```

n. Edit Domain Forwarders  file like this. E.G:
```
options {
        directory "/var/cache/bind";

        allow-query{any;};
        recursion yes;

        forwarders {
        192.168.10.27;
        8.8.8.8;
        8.8.4.4;
        };
        dnssec-validation auto;

        #listen-on-v6 { any; };
};
```

Note: 
_"Untuk Server ke-2 (cilestri-2) bisa terapkan hal yang sama dengan yang Server 1 (cilestri-1) untuk Backup DNS. Berikut dibawah ini:"_
_"Jangan lupa juga untuk menginstall package libuv di kedua Server ya, apabila menemukaman masalah atau error lagi dengan cara:"_
```
# Update packageds dan/atau packages yang hilang atau bermasalah
apt-get update or apt-get update --fix-missing
# Pemasangan pacakage Libuv
apt-get install libuv1 libuv1-dev libh2o-dev libh2o0.13 libluv-ocaml libluv-ocaml-dev libluv-unix-ocaml libluv-unix-ocaml-dev libuvc-dev libuvc-doc libuvc0 lua-luv  lua-luv-dev
# Update lagi repositories-nya
apt-get update
# Add the repo
add-apt-repository ppa:acooks/libwebsockets6
# Install this pacakage
apt install software-properties-common
# Try to set Network
netplan try
# Tes ping koneksi ke IP dan Domain
ping 8.8.8.8
ping google.com
# Restart DNS Server (bind9)
service bind9 restart
systemctl restart bind9.service
# Check Bind9 status
systemctl status bind9.service
```

```bash
cp db.local db.cilestri_fwd
cp db.local db.cilestri_rvs
```
o. Edit "db.cilestri_fwd" di sisi Server 2 (cilestri-2)
```
nano db.cilestri_fwd
nano db.cilestri_fwd --linenumbers
vi db.cilestri_fwd
```
p. Edit DNS Forward like this. E.G:
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     cilestri.web. root.cilestri.web. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.cilestri.id.
@       IN      NS      ns2.cilestri.id.
@       IN      A       192.168.10.28
@       IN      MX 5    mail.cilestri.id.
@       IN      MX 5    192.168.10.28
ns1     IN      A       192.168.10.27
ns2     IN      A       192.168.10.28
www     IN      A       192.168.10.28
blog    IN      A       192.168.10.28
ftp     IN      A       192.168.10.28
mail    IN      A       192.168.10.28
monitor IN      A       192.168.10.28
```
q. Edit "db.cilestri_rvs" file di sisi Server 2 (cilestri-2)
```
nano db.cilestri_rvs
nano db.cilestri_rvs --linenumbers
vi db.cilestri_rvs
```
r. Edit DNS Reverse like this. E.G:
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     cilestri.id. root.cilestri.id. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.cilestri.id.
@       IN      NS      ns2.cilestri.id.
27      IN      PTR     ns1.cilestri.id.
28      IN      PTR     ns2.cilestri.id.
28      IN      PTR     cilestri.id.
28      IN      PTR     www.cilestri.id.
28      IN      PTR     blog.cilestri.id.
28      IN      PTR     mail.cilestri.id.
28      IN      PTR     ftp.cilestri.id.
28      IN      PTR     monitor.cilestri.id.
```
s. Edit "named.conf.local" file di sisi Server 2 (cilestri-2)
```
nano named.conf.local
nano named.conf.local --linenumbers
vi named.conf.local
```

t. Edit Zones file like this. E.G:
```
zone "cilestri.id" IN {
        type slave;
        file "/etc/bind/db.cilestri_fwd";
        masters {192.168.10.27;};
};

zone "10.168.192.in-addr.arpa" IN {
        type slave;
        file "/etc/bind/db.cilestri_rvs";
        masters {192.168.10.27;};
};
```
u. Edit "named.conf.options" file di sisi Server 2 (cilestri-2)
```
nano named.conf.options
nano named.conf.options --linenumbers
vi named.conf.options
```

v. Edit Domain Forwarders  file like this. E.G:
```
options {
        directory "/var/cache/bind";

        allow-query{any;};
        recursion yes;

        forwarders {
        192.168.10.28;
        8.8.8.8;
        8.8.4.4;
        };
        dnssec-validation auto;

        #listen-on-v6 { any; };
};
```
Note:
_"Untuk cara cepatnya bisa lakukan ini dengan mengirimkan file ke Server 2 (cilestri-2) sebagai Backup DNS dengan cara berikut:"_

_"Jangan lupa untuk lakukan perintah ini 'systemd-resolve --flush-caches' dan di sisi client atau host 'ipconfig /flushdns' di Server 1-3 "_
```
# Masuk direktorinya terlebih dahulu
cd /etc/bind/
# Kirim file dari Server 1 (cilestri-1) ke Server 2 (cilestri-2)
scp db.cilestri_fwd db.cilestri_rvs named.conf.options named.conf.local root@192.168.10.28:/etc/bind/
# Tinggal ubah sedikit dan sesuaikan saja
# Seperti DNS Forward, DNS Reverse, Zones, dan Domain Forwarders bisa ikuti contoh sebelumnya yang bagian Server 2 (cilestri-2) ya
```
x. Verify your Domain Servers
```
# Do Ping
ping cilestri.id
ping ns1.cilestri.id
ping ns2.cilestri.id
ping www.cilestri.id
ping blog.cilestri.id
ping ftp.cilestri.id
ping mail.cilestri.id
ping monitor.cilestri.id
ping 192.168.10.27
ping 192.168.10.28
# Do Nslookup
nslookup cilestri.id
nslookup 192.168.10.27
nslookup 192.168.10.28
# Do Dig
dig cilestri.id
dig 192.168.10.27
dig 192.168.10.28
# Do Tracepath
tracepath cilestri
# Do checkconf
named-checkconf -p /etc/bind/named.conf
named-checkconf -p /etc/bind/named.conf.local
named-checkconf -p /etc/bind/named.conf.options
```
# 9. Install UFW (Firewall)
a. Install UFW
```
apt update
apt install ufw
```
b. Check UFW status
```
ufw status
ufw status numbered
```
c. Enable UFW
```
ufw enable
```
d. Izinkan beberapa port yang perlu diizinkan
```
ufw allow 21
ufw allow 22
ufw allow 53
ufw allow 80
ufw allow 443
# Cek kembali untuk port apa saja yang sudah di berikan izin
ufw status numbered
```

# 10. Install Additional Tools
```
apt-get update
# Net Tools (ifconfig)
apt install net-tools
# Up and Down Network Interfaces (ifupdown)
apt install ifupdown
# Git
apt install git
# Composer
apt install composer
# NPM (Yarn)
apt install npm
# CMD Test
apt install cmdtest
# Plocate
apt install plocate
```

## 11. Install Web Server 
a. Install Apache2
```
apt-get update
apt-get update --fix-missing
apt install apache2 apache2-utils
```
b. Check Apache2 status
```
systemctl status apache2.service
```
c. Install Mariadb Server
```
apt install mariadb-server
```
d. Setup MySQL/MariaDB
```
mysql_secure_installation

#
Enter current password for root (enter for none): (You can fill your password for root user. Fill blank if you don't want to blank password.)
Switch to unix_socket authentication [Y/n] n
Change the root password? [Y/n] n
Remove anonymous users? [Y/n] y
Disallow root login remotely [Y/n] y
Remove test database and access to it? [Y/n] y
Reload privilege tables now? [Y/n] y
```
e. Tes login with "root" user, Show Database, Use, Create, Insert, Save Show a few Columns, Drop Database, and Drop Tables
```
mysql -u root -p

# Fill the password, if requered
...
# Show Databases
show databases;
# Show tables
show tables;
# Show a few columns
select host,user,password from mysql.user;
# Create New Database
create database library;
# Select New Database
use library;
# Create New Table
create table library.buku (id_buku int AUTO_INCREMENT, judul_buku varchar(50), penulis_buku varchar(50), primary key(id_buku));
# INsert Record or Row
insert into library.buku(id_buku, judul_buku, penulis_buku) values (1, "MikroTik", "Riko");
insert into library.buku(id_buku, judul_buku, penulis_buku) values "2, "Cisco", "Reffal");
# Save Transaction Record
commit;
commit work;
# Show Buku table
select * from library.buku
# Delete Database
drop database library
# Delete Table
drop table buku;

```
f. Install PHP & Extensions and Check PHP version
```
# Install PHP & Extensions
apt install php php-cgi libapache2-mod-php php-common php-pear php-mbstring -y
# Check PHP version
php -v
```
g. Active Module & Reload Apache2
```
# Active Module
a2enconf php8.1-cgi
# Reload Apache2
systemctl reload apache2
```
h. Edit Date Timezone and Masukan sesuaikan dengan zona negara masing-masing
```
# Edit file
nano /etc/php/8.1/apache2/php.ini
nano /etc/php/8.1/apache2/php.ini --linenumbers
vi /etc/php/8.1/apache2/php.ini
# 
date.timezone = Asia/Jakarta
```
i. Create file and masukan teks PHP ini "<?php phpinfo(); ?>"
```
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
```
j. Masukan dan set DNS melalui Windows agar dapat diakses Domain cukup menggunakan nama tanpa harus menggunakan IP Address
```
# Edit file "hosts" di Windows 
C:/Windows/System32/drivers/etc/hosts
# Tambahkan paling bawah skrip. E.G berikut:
# Sesuaikan dengan jaringan lokal masing-masing
192.168.10.23 cilestri.id
192.168.10.27 cilestri.id
192.168.10.28 cilestri.id

# On Windows
# Set DNS Static on your Network Adapter
# Go to "Control Panel\Network and Internet\Network and Sharing Center"
# Then click "Ethernet" based on your Ethernet Adapter name >
# Click "Properties" > Double Click Internet Protocl Version 4 (TCP/IPv4)
# Checklist "Use the following DNS server addresses:"
# Fill in "Preferred DNS server: 192.168.10.27" & "Alternate DNS server: 192.168.10.28"
# Then click "OK" 2x and "Close"
```
k. Pengujian Web Server dan PHP yang telah dibuat
```
# Access the Web Server. E.G:
http://cilestri.id
# Or you can access by using IP Address
http://192.168.10.27
# You want to check PHP wheter is running or not
http://cilestri.id/info.php
http://192.168.10.27/info.php
```
l. Install PHP-FPM (PHP FastCGI Manager), enable module, dan edit tambahkan skrip berikut:
```
# Backup file default configuration
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.backup
# Edit file "000-default.conf"
nano /etc/apache2/sites-available/000-default.conf
# Enable web configuration
a2ensite 000-default.conf
# Restart Apache2
service apache2 restart
# Enable Modules
a2enmod proxy_fcgi setenvif
a2enconf php8.1-fpm
# Restart "php8.1-fpm" and "apache2"
systemctl restart php8.1-fpm apache2
```
m. Create new directory for Games and Git Clone "2048.git"
```
# Create new directory "Games"
mkdir /var/www/games/
# Git Clone "2048.git"
git clone -v https://github.com/gabrielecirulli/2048.git /var/www/games
# Change Owner to "www-data:www-data"
chown -R www-data:www-data /var/www/games
# Go to directory "sites-available"
cd /etc/apache2/sites-available
# Create duplicate file Web configuration
cp 000-default.conf games.conf
# Enable Web configuration
a2ensite games.conf
# Disable Web configuration
a2dissite 000-default.conf
# Edit file "games.conf"
nano games.conf
# Add this script
<VirtualHost *:80>
        <FilesMatch \.php$>
                SetHandler "proxy:unix:/var/run/php/php8.1-fpm.sock|fcgi://localhost/"
        </FilesMatch>

        ServerName www.cilestri.id

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/games

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
# Reload and Check Apache2 status
systemctl reload apache2.service
systemctl status apache2.service
```
```
mysql -u root -p
# Password: (Masukan password)
# Jalankan perintah ini untuk mereset password untuk "root"
SET PASSWORD FOR root@localhost=PASSWORD('');
```























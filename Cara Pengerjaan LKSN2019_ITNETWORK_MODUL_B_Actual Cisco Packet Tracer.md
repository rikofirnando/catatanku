Berikut langkah-langkah cara Pengerjaan LKSN2019_ITNETWORK_MODUL_B_Actual Cisco Packet Tracer: 
A. DSW-01 Multi Layer Switch (MLS)
Permasalahan yang terjadi:
a. Belum membuat "VLAN 20 Voice" dan mengaktifkan "Switchport mode trunk"
1. DSW-01(config)#vlan 20
2. DSW-01(config-vlan)#name Voice
3. DSW-01(config-if)#interface vlan 20
4. DSW-01(config-if)#switchport mode trunk
5. DSW-01(config-if)#no shutdown

b. Port Channel 1 seharusnya membuat "Switch Mode Trunk" posisi "Switch Shutdown"
1. DSW-01(config)#interface port-channel 1
2. DSW-01(config-if)#switchport mode trunk
3. DSW-01(config-if)#no shutdown

c. Gigabit Ethernet 1/0/2 seharusnya "Switchport mode trunk" bukan "Switchport mode dynamic desireable"
1. DSW-01(config)#int g1/0/2
2. DSW-01(config-if)#switch mode trunk
3. DSW-01(config-if)#no shutdown
4. DSW-01(config-if)#do write
5. DSW-01(config-if)#do show run
6. DSW-01(config-if)#do reload

B. DSW-01 Multi Layer Switch (MLS)
a. Belum membuat DHCP Server beserta DNS Server
1. DSW-01(config)#ip dhcp pool lan
2. DSW-01(config-if)#dns-server 1.1.1.1
3. DSW-01(config-if)#do write
4. DSW-01(config-if)#do show run

C. ASW-01 Switch
a. Permasalahannya pada domain yang tidak cocok/sama (match) dengan domain yang diinginkan/dituju. Solusinya memperbaiki nama domain menjadi "wsc2019.ru" di VTP
1. ASW-01(config):do sh vlan brief
2. ASW-01(config):vtp Domain wsc2019.ru
3. ASW-01(config):do show vtp status
4. ASW-01(config):do show vlan 
5. ASW-01(config):do show running

b. Permasalahan terdapat pada interface Fa0/1 keadaan "shutdown" atau mati interface fa0/1 harus dinyalakan, fa0/2 harus "Switchport mode trunk", fa0/6 seharusnya menggunakan "vlan 10" bukan "vlan 20"
1. ASW-01(config):int fa0/1
2. ASW-01(config-if):no shutdown
3. ASW-01(config-if):int fa0/2
4. ASW-01(config-if):switchport mode trunk
5. ASW-01(config):int fa0/6
6. ASW-01(config):switchport access vlan 10

A. Laptop (KG8)
a. Cek disisi client yang terhubung ke switch "ASW-01" pada laptop KG8
1. Laptop (KG8)
2. Desktop
3. IP Address
4. Pilih "DHCP"

b. Permasalahan belum terdapat alamat IP VLAN 20 yang diinginkan soal, solusinya harus mengkonfigurasi IP VLAN 20
1. ASW-01(config):int vlan 20
2. ASW-01(config):ip address 192.168.20.250 255.255.255.0
3. ASW-01(config):do write

c. Pastikan kembali apakah sudah dikonfigurasi IP Addressnya di sisi switch "ASW-01" dan sisi client Phone KREMLIN (7960)
1. Arahkan kursor pada switch dan diamkan sesaat
2. Arahkan kursor pada KREMLIN 7960 dan diamkan sesaat

D. FW-01
a. Permasalahan terdapat pada interface Gig1/3 keadaan "shutdown"
FW-01(config):int gig1/3
FW-01(config-if):no shutdown
FW-01(config-if):do write

E. RT-MOW
a. Permasalahan terdapat pada NAT disisi interface Gig0/1 interface nat mengarah keluar jaringan
1. RT-MOW(config):int g0/1
2. RT-MOW(config)-if:ip nat outside
3. RT-MOW(config):do write
4. RT-MOW(config):do show run

F. Pengujian antar client to client ke jaringan luar
1. Tes ping Laptop KGB ke Phone YURI
2. Tes ping KREMLIN ke Phone YURI
3. Ubah IP Dynamic menjadi Static dan nyalakan kembali ke "DHCP" pada Laptop KGB
4. Pastikan kembali apakah Line Number sudah otomatis terisi 1001
5. Arahkan kursor ke Laptop KGB, Lihatlah!
6. Klik dan cek ke Desktop > IP Communicator. Apakah sudah ada Line Number 1001?
7. Kemudian cek juga KREMLIN dengan mengarahkan kursor pada Phone KREMLIN atau bisa klik langsung pada Phone > GUI > Zoom In > Lihatlah! Apakah sudah sesuai dengan yang diinginkan soal/pada tabel Ext. Number/Line Number?
8. Cek juga YURI sama seperti poin 7

G. RT-KVX
a. Permasalahan pada Router RT-KVX pada bagian interface se0/1/0 yang belum di "encapsulation ppp, authentication ppp, ppp pap sent-username RT-KVX password Pa$$worD" dan belum dinyalkan pada sisi interface se0/1/0. Solusinya nyalakan interface se0/1/0 dan tambahkan dan konfigurasi "encapsulation ppp, authentication ppp, ppp pap sent-username RT-KVX password Pa$$worD" dan pastikan apakah sudah up atau belum? 
1. RT-KVX(config):int se0/1/0
2. RT-KVX(config-if):no shutdown
3. RT-KVX(config-if):encapsulation ppp
4. RT-KVX(config-if):authentication ppp
5. RT-KVX(config-if):ppp pap sent-username RT-KVX password Pa$$worD
6. RT-KVX(config-if):do sh int se0/1/0
7. RT-KVX(config-if):do write

b. Permasalahan pada Autonomous (AS) Number "ospf 300" seharusnya adalah "ospf 3000" sesuai dengan disoal ubah ke "ospf 3000" dan "network 192.168.100.0 255.255.255.0 area 1, network 10.1.1.0 255.255.255.252 area 0, network 10.0.1.0 255.255.255.0 area 0" 
1. RT-KVX(config):no router ospf 300
2. RT-KVX(config):router ospf 3000
3. RT-KVX(config-if):network 192.168.100.0 255.255.255.0 area 1
4. RT-KVX(config-if):network 10.1.1.0 255.255.255.252 area 0
5. RT-KVX(config-if):network 10.0.1.0 255.255.255.0 area 0
6. RT-KVX(config-if):do wr
7. RT-KVX(config-if):do show ip ospf

H. Pengujian tes ping 1.1.1.1 atau ke "wsc2019.ru" melalui semua clients/devices, setting DNS services pada "Server-PT wsc2019.ru", dan pengujian ping kedua laptop ke Server-PT wsc2019.ru, kemudian tes internet ke "wsc2019.ru" apakah sudah berjalan atau belum?
1. Klik Server-PT wsc2019.ru
2. Services
3. DNS
4. Masukan "Name: Server-PT wsc2019.ru, dan Address: 1.1.1.1"
5. Save
6. Pengujian ping "ICMP" dari 2 Laptop ke Server-PT wsc2019.ru
7. Cek melalui Browser, 
8. Klik Server-PT ROSATOM
9. Pilih Tab Desktop
10. Kemudian, klik Web Browser
11. Masukan wsc2019.ru
12. Pengujian dari sisi client kedua Laptop sama seperti di poin 8-11 
13. Cek IP NAT pada router "RT-MOW" > do show ip nat/show ip nat 

I. Pengujian antar Telepon (PHONE) untuk saling menghubungi satu sama lain dengan memasukan Ext. Number/Line Number dan pastikan apakah sudah atau berhasil terhubung 
1. KREMLIN: 1002 (Hubungi YURI)
2. dan sebaliknya YURI: 1001 (Hubungi KREMLIN)
3. Terakhir hubungi ke Laptop KGB
4. Apakah sudah bisa terhubung atau belum?

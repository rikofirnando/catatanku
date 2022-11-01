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

c. Cek disisi client yang terhubung ke switch "ASW-01" pada laptop KG8
1. Laptop (KG8)
2. Desktop
3. IP Address
4. Pilih "DHCP"

c. Permasalahan belum terdapat alamat IP VLAN 20 yang diinginkan soal, solusinya harus mengkonfigurasi IP VLAN 20
1. ASW-01(config):int vlan 20
2. ASW-01(config):ip address 192.168.20.250 255.255.255.0
3. ASW-01(config):do write

d. Pastikan kembali apakah sudah dikonfigurasi IP Addressnya di sisi switch "ASW-01" dan sisi client Phone KREMLIN (7960)
1. Arahkan kursor pada switch dan diamkan sesaat
2. Arahkan kursor pada KREMLIN 7960 dan diamkan sesaat


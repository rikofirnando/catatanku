Berikut langkah-langkah cara Pengerjaan LKSN2019_ITNETWORK_MODUL_B_Actual Cisco Packet Tracer: 
A. DSW-01 Multi Layer Switch (MLS)
Permasalahan yang terjadi:
a. Belum membuat VLAN 20 (Voice) dan mengaktifkan "Switchport mode trunk"
1. DSW-01(config)#vlan 20
2. DSW-01(config)#name Voice
3. DSW-01(config)#interface vlan 20
4. DSW-01(config)#switchport mode trunk
5. DSW-01(config)#no shutdown

b. Port Channel 1 seharusnya membuat "Switch Mode Trunk" posisi "Switch Shutdown"
1. DSW-01(config)#interface port-channel 1
2. DSW-01(config)#switchport mode trunk
3. DSW-01(config)#no shutdown

c. Gigabit Ethernet 1/0/2 seharusnya "Switchport mode trunk" bukan "Switchport mode dynamic desireable"
1. DSW-01(config)#int g1/0/2
2. DSW-01(config)#switch mode trunk
3. DSW-01(config)#no shutdown
4. DSW-01(config)#do write
5. DSW-01(config)#do show run
6. DSW-01(config)#do reload

B. DSW-01 Multi Layer Switch (MLS)
a. Belum membuat DHCP Server beserta DNS Server
1. DSW-01(config)#ip dhcp pool lan
2. DSW-01(config)#dns-server 1.1.1.1
3. DSW-01(config)#do write
4. DSW-01(config)#do show run

C. ASW-01 Switch
a. Permasalahannya pada domain yang tidak cocok/sama (match) dengan domain yang diinginkan/dituju. Solusinya memperbaiki nama domain menjadi "wsc2019.ru" di VTP
1. ASW-01(config):do sh vlan brief
2. ASW-01(config):vtp Domain wsc2019.ru
3. ASW-01(config):do show vtp status
4. ASW-01(config):do show vlan 
5. ASW-01(config):do show running

b. Permasalahan terdapat pada Fa0/1 keadaan "shutdown" atau mati harus dinyalaka, fa0/2 harus "Switchport mode trunk", fa0/6 seharusnya menggunakan "vlan 10" bukan "vlan 20" 

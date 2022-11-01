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
8. DSW-01(config)#int g1/0/2
7. DSW-01(config)#switch mode trunk
8. DSW-01(config)#no shutdown
9. DSW-01(config)#do write
10. DSW-01(config)#do show run
11. DSW-01(config)#do reload


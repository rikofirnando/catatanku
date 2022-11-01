ENGLISH

Bandwidth speed limitation using script simple queues method

Here's how to use the script:
The following are the steps to use the script:
1. Copy the following script:
:for e from 2 to 100 do={ /queue simple add name="Client-$e" target="192.168.2.$e" max-limit=1M/2M burst-limit=2M/20M burst-threshold=1M/5M burst-time=5s/10s limit-at=1M/2M parent=total }
2. Next, launch the Winbox application.
3. Select the "New Terminal" tab and paste the copied script into it.
4. Copy it and paste it into the "New Terminal" screen.
5. Finally, press "Enter" to run / enter the script into MikroTik, and it will be created automatically. The IP Address can be changed to match the IP Address and client name that was specified.

BAHASA INDONESIA

Limitasi kecepatan bandwidth menggunakan metode skrip 

Bagaimana cara menggunakan skrip?
Langkah-langkah menggunakan skrip berikut:
1. Salin/Copy skrip dibawah ini:

:for e from 2 to 100 do={ /queue simple add name="Client-$e" target="192.168.2.$e" max-limit=1M/2M burst-limit=2M/20M burst-threshold=1M/5M burst-time=5s/10s limit-at=1M/2M parent=total }

2. Kemudian, buka aplikasi Winbox.
3. Buka Tab "New Terminal" untuk memasukan skrip yang telah disalin.
4. Lalu, Tempel/Paste pada layar "New Terminal" tersebut.
5. Setelah itu, klik "Enter" untuk menjalankan/memasukan skrip tersebut kedalam MikroTik dan secara otomatis akan terbuat. Untuk alamat IP Address bisa disesuaikan dengan IP Address and name client yang telah di tentukan.

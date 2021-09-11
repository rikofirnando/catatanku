Bandwidth limitation using a script (Simple Queues) on MikroTik

Bagaimana cara menggunakannya?
Salin/Copy skrip dibawah ini:

:for e from 2 to 100 do={ /queue simple add name="Client-$e" target="192.168.2.$e" max-limit=1M/2M burst-limit=2M/20M burst-threshold=1M/5M burst-time=5s/10s limit-at=1M/2M parent=total }

Kemudian, buka aplikasi Winbox.
Buka Tab "New Terminal" untuk memasukan skrip yang telah disalin.
Lalu, Tempel/Paste pada layar "New Terminal" tersebut.
Setelah itu, klik "Enter" untuk menjalankan/memasukan skrip tersebut kedalam MikroTik dan secara otomatis akan terbuat. Untuk alamat IP Address bisa disesuaikan dengan IP Address and name client yang telah di tentukan.

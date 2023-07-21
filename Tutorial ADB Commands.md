# Tutorial ADB Commands
## Cara menyalakan mode "USB debugging"
1. Pastikan mode debugging sudah menyala pada perangkat Android caranya jika menggunakan HP Samsung
Contoh Samsung A21s:
- Pergi menuju "Settings"
- Kemudian "About phone"
- Lalu, "Software Information"
- Klik berkali-kali pada "Build number" hingga muncul pesan You're now developer bla bla bla
2. Kembali ke tampilan "Settings"
3. Scroll paling bawah nanti akan ada menu "Developer options"
4. Jika sudah, nyalakan mode "USB Debugging"
5. Tara, sekarang kamu sudah mengaktifkan mode "USB Debugging"

## Cara install paket atau aplikasi (.apk)
1. Pastikan sudah terinstall aplikasi "Minimal ADB and Fastboot" bisa cari di internet banyak
2. Sediakan aplikasi atau (.apk) yang akan di install pastikan juga file *.apk-nya ditaruh di aplikasi yang sudah terinstall, sehingga mempermudah untuk menginstall aplikasi karena tidak perlu definisikan letak aplikasi tersebut
3. Tinggal install dengan cara "adb install [Nama_Aplikasi-nya]" catatan harus dengan ekstensi *.apk
4. Kemudian tunggu hingga muncul pesan "Success"

## Cara uninstall paket atau aplikasi (.apk)
1. Cari nama aplikasi tersebut
- adb shell pm list packages
2. Jika sudah ketemu aplikasi yang ingin di uninstall dapat langsung uninstall dengan cara berikut:
- adb uninstall com.topjohnwu.magisk
- Tunggu sampai muncul pesan "Success" artinya sudah berhasil meng-uninstall aplikasi
- Alternatif jika ingin force uninstall dapat lalkukan dengan cara "adb uninstall -k com.topjohnwu.magisk"
 

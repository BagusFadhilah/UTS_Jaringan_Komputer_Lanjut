#Topologi Mesh Partial

Router R1 (CR):

Terhubung ke Router R2 (KHI) melalui antarmuka Ethernet 4 (10.10.10.1).
Terhubung ke Router R3 (KJ) melalui antarmuka Ethernet 3 (15.15.15.1).
Terhubung ke jaringan lokal dengan antarmuka Ethernet 2 (192.168.10.1/24) yang mengarah ke komputer lokal di bawahnya.

Router R2 (KHI):

Terhubung ke Router R1 (CR) melalui antarmuka Ethernet 4 (10.10.10.2).
Terhubung ke Router R3 (KJ) melalui antarmuka Ethernet 3 (20.20.20.1).
Terhubung ke jaringan lokal dengan antarmuka Ethernet 2 (192.168.20.1/24) yang mengarah ke komputer lokal di sebelah kanan.

Router R3 (KJ):

Terhubung ke Router R1 (CR) melalui antarmuka Ethernet 4 (15.15.15.2).
Terhubung ke Router R2 (KHI) melalui antarmuka Ethernet 3 (20.20.20.2).
Terhubung ke jaringan lokal dengan antarmuka Ethernet 2 (192.168.30.1/24) yang mengarah ke komputer lokal di sebelah kiri.

------------------------------------------------------------------------------------------------------------------------------------------

Setiap router dalam topologi ini menggunakan protokol Routing RIP untuk mendistribusikan informasi routing ke seluruh jaringan, memungkinkan tiap router mengetahui jalur terbaik untuk mencapai jaringan yang berbeda.

Komputer lokal pada setiap segmen IP (192.168.10.0/24, 192.168.20.0/24, 192.168.30.0/24) berperan sebagai end-user yang terhubung ke masing-masing router.

------------------------------------------------------------------------------------------------------------------------------------------

Dalam tugas praktikum ini, saya telah mengonfigurasi tiga router (R1 CR, R2 KHI, dan R3 KJ) menggunakan Winbox dengan protokol Routing RIP. Topologi jaringan ini dirancang untuk menghubungkan beberapa jaringan lokal yang berbeda melalui protokol RIP, yang akan meng-update rute secara otomatis di antara router-router ini.

##Penjelasan Setiap Router
Router R1 (CR):

Fungsi: R1 berfungsi sebagai router pusat yang menghubungkan jaringan lokal 192.168.10.1/24 ke router lainnya.
Konfigurasi IP:
Ethernet 2 terhubung ke jaringan lokal 192.168.10.0/24 dengan IP 192.168.10.1.
Ethernet 3 dan Ethernet 4 digunakan untuk menghubungkan router ini ke R2 dan R3 dengan IP sesuai topologi.
RIP: R1 dikonfigurasi untuk menggunakan RIP agar dapat berkomunikasi dan berbagi informasi rute dengan router lain.

Router R2 (KHI):

Fungsi: R2 menghubungkan jaringan lokal 192.168.20.1/24 dan berperan dalam mengalirkan data antara R1 dan R3.
Konfigurasi IP:
Ethernet 2 terhubung ke jaringan lokal 192.168.20.0/24 dengan IP 192.168.20.1.
Ethernet 3 dan Ethernet 4 digunakan untuk komunikasi antar router.
RIP: R2 juga dikonfigurasi untuk menggunakan RIP agar rute ke jaringan-jaringan lain dapat diperbarui otomatis.

Router R3 (KJ):

Fungsi: R3 berfungsi sebagai penghubung jaringan lokal 192.168.30.1/24 dan berkomunikasi dengan R1 dan R2.
Konfigurasi IP:
Ethernet 2 terhubung ke jaringan lokal 192.168.30.0/24 dengan IP 192.168.30.1.
Ethernet 3 dan Ethernet 4 menyediakan koneksi ke R1 dan R2.
RIP: Sama dengan router lainnya, R3 juga dikonfigurasi dengan RIP untuk memastikan semua router saling mengetahui rute ke setiap jaringan.

Konfigurasi ini memungkinkan setiap jaringan lokal (192.168.10.0/24, 192.168.20.0/24, dan 192.168.30.0/24) dapat saling berkomunikasi melalui routing dinamis menggunakan RIP. Dengan RIP, rute antar jaringan dapat diperbarui otomatis, sehingga ketika ada perubahan dalam jaringan, router bisa menyesuaikan rute tanpa perlu konfigurasi manual.

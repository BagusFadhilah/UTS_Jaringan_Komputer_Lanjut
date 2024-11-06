# Topologi Hub-and-Spoke Wan

![Topologi Jaringan Komputer Lanjut (2)](https://github.com/user-attachments/assets/10856555-cbe7-49fc-99eb-e8b680bd903c)


Topologi jaringan pada gambar ini adalah topologi WAN berbasis hub-and-spoke yang digunakan untuk menghubungkan tiga kampus (Citra Raya, Kebon Jeruk, dan Harapan Indah) yang berada di lokasi geografis berbeda.

1).Jenis Topologi: Hub-and-Spoke WAN
Topologi ini mengadopsi model hub-and-spoke, di mana setiap kampus dihubungkan ke jaringan pusat melalui WAN (internet). Dengan kata lain, setiap kampus memiliki koneksi independen yang berpusat pada satu jaringan internet yang berfungsi sebagai “hub”.
Setiap kampus memiliki router yang terhubung ke internet menggunakan IP publik, serta memiliki tunnel point-to-point untuk koneksi langsung antara satu kampus dengan kampus lainnya.

2).Komponen Utama dalam Topologi:
Router dengan IP Publik: Masing-masing kampus memiliki router yang terhubung ke internet menggunakan IP publik:
Kampus Citra Raya menggunakan IP publik 203.0.113.1
Kampus Kebon Jeruk menggunakan IP publik 203.0.113.2
Kampus Harapan Indah menggunakan IP publik 203.0.113.3

Tunnels (IP Tunnel): Tunnel ini berfungsi untuk mengamankan koneksi antar-router melalui internet. Setiap pasangan kampus memiliki IP tunnel point-to-point, contohnya:
IP Tunnel antara Kampus Citra Raya dan Kampus Kebon Jeruk adalah 10.1.1.1/30 dan 10.1.1.2/30.
IP Tunnel antara Kampus Citra Raya dan Kampus Harapan Indah adalah 10.1.2.1/30 dan 10.1.2.2/30.

LAN di Masing-Masing Kampus: Setiap kampus memiliki jaringan LAN yang menghubungkan komputer-komputer di dalam kampus tersebut melalui switch, misalnya:
Kampus Citra Raya memiliki IP LAN 192.168.10.0/24, dengan router sebagai gateway pada 192.168.10.1.
Kampus Kebon Jeruk memiliki IP LAN 192.168.20.0/24, dengan gateway pada 192.168.20.1.
Kampus Harapan Indah memiliki IP LAN 192.168.30.0/24, dengan gateway pada 192.168.30.1.

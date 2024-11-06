# Topologi Hub-and-Spoke Wan

![Topologi H S Jaringan Komputer Lanjut](https://github.com/user-attachments/assets/828e4605-7acf-4c06-8f8f-a0c3fddd0de2)



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

------------------------------------------------------------------------------------------------------------------------------------------

# Config

Konfigurasi IP Address dan Interface di Setiap Kampus
Kampus CR (Citra Raya)
IP Publik di Interface WAN (misalnya ether1):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 203.0.113.1/24
Interface: ether1
IP LAN di Interface LAN (misalnya ether2):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 192.168.10.1/24
Interface: ether2
Kampus KJ (Kebon Jeruk)
IP Publik di Interface WAN (misalnya ether1):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 203.0.113.2/24
Interface: ether1
IP LAN di Interface LAN (misalnya ether2):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 192.168.20.1/24
Interface: ether2
Kampus KHI (Harapan Indah)
IP Publik di Interface WAN (misalnya ether1):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 203.0.113.3/24
Interface: ether1
IP LAN di Interface LAN (misalnya ether2):
plaintext
Copy code
IP > Addresses > + (Add New)
Address: 192.168.30.1/24
Interface: ether2



Konfigurasi IP Tunnel Point-to-Point di Setiap Kampus
Konfigurasi berikut menggunakan GRE Tunnel sebagai contoh. Kita akan menghubungkan router antar kampus untuk membuat koneksi aman antar jaringan lokal di tiga kampus.

Kampus CR
Tunnel ke Kampus KJ:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_KJ
Local Address: 203.0.113.1
Remote Address: 203.0.113.2
Tunnel Address: 10.1.1.1/30
Tunnel ke Kampus KHI:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_KHI
Local Address: 203.0.113.1
Remote Address: 203.0.113.3
Tunnel Address: 10.1.2.1/30
Kampus KJ
Tunnel ke Kampus CR:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_CR
Local Address: 203.0.113.2
Remote Address: 203.0.113.1
Tunnel Address: 10.1.1.2/30
Tunnel ke Kampus KHI:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_KHI
Local Address: 203.0.113.2
Remote Address: 203.0.113.3
Tunnel Address: 10.1.3.1/30
Kampus KHI
Tunnel ke Kampus CR:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_CR
Local Address: 203.0.113.3
Remote Address: 203.0.113.1
Tunnel Address: 10.1.2.2/30
Tunnel ke Kampus KJ:
plaintext
Copy code
Interfaces > GRE Tunnel > + (Add New)
Name: Tunnel_KJ
Local Address: 203.0.113.3
Remote Address: 203.0.113.2
Tunnel Address: 10.1.3.2/30



Routing Static di Setiap Router
Untuk memastikan lalu lintas jaringan dapat mencapai jaringan lokal antar-kampus, kita perlu menambahkan route statis.

Kampus CR
plaintext
Copy code
IP > Routes > + (Add New)
Dst. Address: 192.168.20.0/24
Gateway: 10.1.1.2 (Tunnel ke Kampus KJ)

IP > Routes > + (Add New)
Dst. Address: 192.168.30.0/24
Gateway: 10.1.2.2 (Tunnel ke Kampus KHI)
Kampus KJ
plaintext
Copy code
IP > Routes > + (Add New)
Dst. Address: 192.168.10.0/24
Gateway: 10.1.1.1 (Tunnel ke Kampus CR)

IP > Routes > + (Add New)
Dst. Address: 192.168.30.0/24
Gateway: 10.1.3.2 (Tunnel ke Kampus KHI)
Kampus KHI
plaintext
Copy code
IP > Routes > + (Add New)
Dst. Address: 192.168.10.0/24
Gateway: 10.1.2.1 (Tunnel ke Kampus CR)

IP > Routes > + (Add New)
Dst. Address: 192.168.20.0/24
Gateway: 10.1.3.1 (Tunnel ke Kampus KJ)



Pengujian Koneksi Antar Kampus
Setelah konfigurasi selesai, lakukan pengujian ping antar alamat IP LAN dari setiap kampus untuk memastikan bahwa konfigurasi berhasil:

Dari Kampus CR, coba ping ke 192.168.20.1 (Kampus KJ) dan 192.168.30.1 (Kampus KHI).
Dari Kampus KJ, coba ping ke 192.168.10.1 (Kampus CR) dan 192.168.30.1 (Kampus KHI).
Dari Kampus KHI, coba ping ke 192.168.10.1 (Kampus CR) dan 192.168.20.1 (Kampus KJ).
Jika ping berhasil, berarti konfigurasi jaringan antar-kampus sudah berhasil dibuat.

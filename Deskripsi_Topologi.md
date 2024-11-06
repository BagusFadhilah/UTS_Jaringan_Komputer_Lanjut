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

--------------------------------------------------------------------------------------------------------------------------------------------

Setiap router dalam topologi ini menggunakan protokol Routing RIP untuk mendistribusikan informasi routing ke seluruh jaringan, memungkinkan tiap router mengetahui jalur terbaik untuk mencapai jaringan yang berbeda.

Komputer lokal pada setiap segmen IP (192.168.10.0/24, 192.168.20.0/24, 192.168.30.0/24) berperan sebagai end-user yang terhubung ke masing-masing router.

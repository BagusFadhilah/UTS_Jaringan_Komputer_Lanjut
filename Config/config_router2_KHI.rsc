# jan/02/1970 00:05:47 by RouterOS 6.47.10
# software id = R3AC-AAWW
#
# model = RB941-2nD
# serial number = D1130FD936AB
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.20.1/24 interface=ether2 network=192.168.20.0
add address=10.10.10.2/24 interface=ether4 network=10.10.10.0
add address=20.20.20.1/24 interface=ether3 network=20.20.20.0
/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1
/routing rip interface
add receive=v1 send=v1
/routing rip neighbor
add address=10.10.10.1
add address=20.20.20.2
/routing rip network
add network=192.168.20.254/32
add network=20.20.20.1/32
add network=10.10.10.2/32

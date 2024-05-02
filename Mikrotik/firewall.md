```sh
/ip firewall address-list
add address=192.168.1.1 list=IP-MODEM
add address=192.168.4.100 list=ALLOWED-IP

/ip firewall filter
# allow 1 ip
add action=accept chain=forward comment="Allow specific IP to access modem" dst-address=192.168.1.1 src-address=192.168.4.100
# block all
add action=drop chain=forward comment="Drop all other traffic to modem" dst-address=192.168.1.1
```
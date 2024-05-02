```sh
/ip firewall address-list
add address=192.168.1.1 list=IP-MODEM
/ip firewall filter
add action=drop chain=forward comment="MODEM PROTECTED" disabled=yes dst-address-list=MODEM dst-port=21-23,80,443 protocol=tcp
```
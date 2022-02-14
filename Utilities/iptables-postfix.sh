# Some rules to manage all network traffic

sudo iptables -P FORWARD ACCEPT
sudo iptables --table nat -A POSTROUTING -s 192.168.4.0/23 -o wlo1 -j MASQUERADE

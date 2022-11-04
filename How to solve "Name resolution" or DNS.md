How to solve "Name resolution" or DNS
1. echo "nameserver 8.8.8.8" > /etc/resolv.conf
2. Ping google.com / ping 8.8.8.8
3. rm /etc/resolv.conf
4. ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
5. echo "nameserver 8.8.8.8" > /etc/resolv.conf

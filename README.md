### 1.
Part 3: Install Semua Layanan VPN /Install All VPN Service
Mod By Tarap Kuhing
  <img src="https://img.shields.io/badge/Install_Semua_Layanan_VPN%20Batch-green">
  ```html
rm -f setup.sh && apt update && apt upgrade -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade -y && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Tarap-Kuhing/multiport/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh

```

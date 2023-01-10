#! /bin/bash
# ======================================
# Warna
MERAH= ' \033[0;31m '
NC= ' \033[0m '
HIJAU= ' \033[0;32m '
JERUK= ' \033[0;33m '
BIRU= ' \033[0;34m '
UNGU= ' \033[0;35m '
CYAN= ' \033[0;36m '
CAHAYA= ' \033[0;37m '
# ======================================
# Mendapatkan
jernih
mulai gema
tidur 0,5
sumber /var/lib/tarapkuhing/ipvps.conf
domain= $( kucing /etc/xray/domain )
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs membunuh
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --instal
rm acme.sh
cd .acme.sh
echo  " mulai...., Port 80 Akan di Hentikan Saat Proses install Cert "
bash acme.sh --register-account -m merahjambo@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key

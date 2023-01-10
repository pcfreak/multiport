#!/bin/bash
# @ Copyrigt 2017 Oleh zerossl
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Tanggal | sed -e 's/< Tanggal: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
# Warna
MERAH='\033[0;31m'
NC='\033[0m'
HIJAU='\033[0;32m'
JERUK='\033[0;33m'
BIRU='\033[0;34m'
UNGU='\033[0;35m'
CYAN='\033[0;36m'
CAHAYA='\033[0;37m'

MYIP=$(wget -qO- ipinfo.io/ip);
jernih
domain=$(cat /root/domain)
pembaruan tepat; peningkatan yang tepat -y
apt install python -y ; apt install python3-pip -y
apt install iptables iptables-persistent -y
apt install caddy -y
apt-get install libpcre3 libpcre3-dev zlib1g-dev dbus -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y instal kroni
apt install zip -y
timedatectl set-ntp benar
systemctl aktifkan chronyd && systemctl restart chronyd
systemctl mengaktifkan chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
pelacakan chronyc -v
tanggal

# / / Ambil Xray Core Versi Terbaru
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\ 1/' | kepala -n 1)"

# / / Instalasi Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"
#xraycore_link="https://raw.githubusercontent.com/Tarap-Kuhing/multiport/xray/xray-linux-64.zip"
# / / Membuat Direktori Utama
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
mkdir -p /etc/ssl/private
mkdir -p /usr/local/etc/xray
mkdir -p /home/sstp
mkdir -p /home/vps/public_html
# / / Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray

# Buat Folder XRay
mkdir -p /var/log/xray/
mkdir -p /etc/xray
chown www-data.www-data /var/log/xray
chmod +x /var/log/xray
sentuh /var/log/xray/access.log
sentuh /var/log/xray/error.log
uuid=$(cat /proc/sys/kernel/random/uuid)
#bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root
cd /root/
# Instal Acme
#mkdir /root/.acme.sh
#curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
#chmod +x /root/.acme.sh/acme.sh
#/root/.acme.sh/acme.sh --upgrade --upgrade otomatis
#/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
#/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
#~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc

##Buat sertifikat acme
ikal https://get.acme.sh | SH
alias acme.sh=~/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --upgrade otomatis
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
#/root/.acme.sh/acme.sh --issue -d "${domain}" --mandiri --keylength ec-2048
/root/.acme.sh/acme.sh --issue -d "${domain}" --mandiri --keylength ec-256
/root/.acme.sh/acme.sh --install-cert -d "${domain}" --ecc \
--fullchain-file /etc/ssl/private/fullchain.pem \
--key-file /etc/ssl/private/privkey.pem
chown -R none:nogroup /etc/xray
chown -R none:nogroup /etc/ssl/private
chmod 644 /etc/ssl/private/fullchain.pem
chmod 644 /etc/ssl/private/privkey.pem

#sudo lsof -t -i tcp:80 -s tcp:dengarkan | sudo xargs membunuh
#cd /root/
#wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
#bash acme.sh --instal
#bash acme.sh --register-account -m djarumpentol01@gmail.com
#bash acme.sh --issue --standalone -d $domain --force
#bash acme.sh --installcert -d $domain --fullchainpath /etc/ssl/private/fullchain.pem --keypath /etc/ssl/private/privkey.pem
#chown -R tidak ada:nogroup /etc/xray
#chmod 644 /etc/ssl/private/privkey.pem
#chmod 644 /etc/ssl/private/fullchain.pem

#cd /root/
#wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
#bash acme.sh --instal
#bash acme.sh --daftar-akun -m merahjambo@gmail.com
#bash acme.sh --issue --standalone -d $domain --force
#bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key

#curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
#chmod +x /root/.acme.sh/acme.sh
#/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
#~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install-geodata
uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)

# // Berkas Sertifikat
path_crt="/etc/xray/xray.cer"
path_key="/etc/xray/xray.key"
uuid=$(openssl rand -hex 7)
#domain.key=$(kucing /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
#Buat Config Xray
kucing > /etc/xray/config.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 8443,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tl
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess/",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

kucing > /etc/xray/tes.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 8433,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

#uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Berkas Sertifikat
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(kucing /root/.acme.sh)
#domain.key=$(kucing /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
#Buat Config Xray
kucing > /etc/xray/xvless.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 7649,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess/",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

#uuid=$(cat /proc/sys/kernel/random/uuid)

domain=$(cat /root/domain)
# // Berkas Sertifikat
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(kucing /root/.acme.sh)
#domain.key=$(kucing /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
#Buat Config Xray
kucing > /etc/xray/xtrojan.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 2908,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess/",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

#uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
# // Berkas Sertifikat
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
base64=$(openssl rand -base64 16)
#domain_ecc=$(kucing /root/.acme.sh)
#domain.key=$(kucing /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
#Buat Config Xray
kucing > /etc/xray/xvmess.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 9087,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess/",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

#uuid=$(cat /proc/sys/kernel/random/uuid)
base64=$(openssl rand -base64 16)
domain=$(cat /root/domain)
# // Berkas Sertifikat
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"
#domain_ecc=$(kucing /root/.acme.sh)
#domain.key=$(kucing /root/.acme.sh/$domain_ecc)
#path_crt="/root/.acme.sh/$domain_ecc/fullchain.cer"
#path_key="/root/.acme.sh/$domain_ecc/$domain.key"
#Buat Config Xray
kucing > /etc/xray/xss.json << AKHIR
{
  "catatan": {
    "akses": "/var/log/xray/access.log",
    "kesalahan": "/var/log/xray/error.log",
    "tingkat log": "info"
  },
  "masuk": [
    {
      "pelabuhan": 209,
      "protokol": "vmess",
      "pengaturan": {
        "klien": [
          {
            "id": "${uuid1}",
            "alterId": 32
#xray-vmess-tls
          }
        ]
      },
      "streamPengaturan": {
        "jaringan": "ws",
        "keamanan": "tls",
        "tlsPengaturan": {
          "sertifikat": [
            {
              "berkas sertifikat": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsPengaturan": {
          "jalur": "/vmess/",
          "tajuk": {
            "Tuan rumah": ""
          }
        },
        "quicSettings": {}
      }
    }
AKHIR

# / / Pemasangan Layanan Xray
cat > /etc/systemd/system/xray.service << END
[Satuan]
Description=XRAY ROUTING DAM COLO PENGKOL OLEH WISNU
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray jalankan -config /etc/xray/config.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

# / / Pemasangan Layanan Xray
cat > /etc/systemd/system/tes.service << END
[Satuan]
Description=XRAY ROUTING DAM COLO PENGKOL OLEH WISNU
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray run -config /etc/xray/tes.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

cat > /etc/systemd/system/xvmess.service << END
[Satuan]
Description=XVMESS ROUTING GAJAH DEMAK BY GANDRING
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray jalankan -config /etc/xray/xvmess.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

# / / Pemasangan Layanan Xray
cat > /etc/systemd/system/xss.service << END
[Satuan]
Description=XSHADOWSOCCKS ROUTING DAM COLO PENGKOL OLEH WISNU
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray run -config /etc/xray/xss.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

# / / Pemasangan Layanan Xray
cat > /etc/systemd/system/xtrojan.service << END
[Satuan]
Description=ROUTING XTROJAN DAM COLO PENGKOL OLEH Z
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray jalankan -config /etc/xray/xtrojan.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

# / / Pemasangan Layanan Xray
cat > /etc/systemd/system/xvless.service << END
[Satuan]
Description=XVLESS ROUTING DAM COLO PENGKOL OLEH Z
Dokumentasi=https://t.me/zerossl
After=network.target nss-lookup.target

[Melayani]
Pengguna = www-data
Pengguna=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=benar
ExecStart=/usr/local/bin/xray jalankan -config /etc/xray/xvless.json
Mulai ulang = saat gagal
RestartPreventExitStatus=23
BatasNPROC=10.000
BatasNOFILE=1000000

[Install]
WantedBy=multi-pengguna.target
AKHIR

systemctl daemon-reload
systemctl aktifkan xray.service
systemctl mulai xray.service
systemctl restart xray.service

systemctl daemon-reload
systemctl aktifkan tes.service
systemctl mulai tes.service
systemctl restart tes.service

##mulai ulang & mulai layanan
systemctl daemon-reload
systemctl aktifkan xtrojan.service
systemctl restart xtrojan.service

##mulai ulang & mulai layanan
systemctl daemon-reload
systemctl aktifkan xvless.service
systemctl mulai xvless.service
systemctl restart xvless.service

##mulai ulang & mulai layanan
systemctl daemon-reload
systemctl aktifkan layanan xss
systemctl mulai xss.service
systemctl restart xss.service

##mulai ulang & mulai layanan
systemctl daemon-reload
systemctl aktifkan xvmess.service
systemctl mulai xvmess.service
systemctl restart xvmess.service

#Trojan Go Akun
mkdir -p /etc/trojan-go/
sentuh /etc/trojan-go/akun.conf
sentuh /etc/trojan-go/uuid.txt

# Memasang Trojan Go
mkd# Instal Trojan Go
latest_version="$(curl -s "https://api.github.com/repos/p4gefau1t/trojan-go/releases" | grep tag_name | sed -E 's/.*"v(.*)".* /\1/' | kepala -n 1)"
trojango_link="https://github.com/p4gefau1t/trojan-go/releases/download/v${latest_version}/trojan-go-linux-amd64.zip"
mkdir -p "/usr/bin/trojan-go"
mkdir -p "/etc/trojan-go"
cd `mktemp -d`
curl -sL "${trojango_link}" -o trojan-go.zip
unzip -q trojan-go.zip && rm -rf trojan-go.zip
mv trojan-go /usr/local/bin/trojan-go
chmod +x /usr/local/bin/trojan-go
mkdir /var/log/trojan-go/
sentuh /etc/trojan-go/akun.conf
sentuh /var/log/trojan-go/trojan-go.log
sentuh /etc/trojan-go/trojan-go.pid

wget -O /etc/xray/geoip.dat https://raw.githubusercontent.com/inoyaksorojawi/large/sae/xray/geoip.dat
wget -O /etc/xray/geosite.dat https://raw.githubusercontent.com/inoyaksorojawi/large/sae/xray/geosite.dat
#Buat Config Trojan Go
cat > /etc/trojan-go/config.json << END
{
  "run_type": "server",
   "local_addr": "0.0.0.0",
    "port_lokal": 2083,
     "remote_addr": "127.0.0.1",
      "port_jauh": 88,
       "tingkat_log": 1,
        "log_file": "/var/log/trojan-go/trojan-go.log",
         "kata sandi": [
          "$uuid"
    ],
    "disable_http_check": salah,
     "udp_timeout": 60,
      "ssl": {
       "verifikasi": benar,
        "verify_hostname": benar,
         "sertifikat": "/etc/xray/xray.crt",
          "kunci": "/etc/xray/xray.key",
           "kata_kunci": "",
            "sandi": "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
             "kurva": "",
              "prefer_server_cipher": benar,
               "sni": "$domain",
                "pegunungan": [
                 "h2",
                  "http/1.1"
    ],
    "session_ticket": benar,
     "reuse_session": benar,
      "plain_http_response": "",
       "fallback_addr": "127.0.0.1",
        "fallback_port": 8443,
         "sidik jari": "chrome"
    },
    "tcp": {
     "no_delay": benar,
      "keep_alive": benar,
       "prefer_ipv4": salah
    },
    "mux": {
     "diaktifkan": benar,
      "konkurensi": 8,
       "idle_timeout": 3600
    },
    "router": {
     "diaktifkan": salah,
      "jalan pintas": [],
       "proksi": [],
        "memblokir": [],
         "default_policy": "proksi",
          "domain_strategy": "as_is",
           "geoip": "/etc/xray/geoip.dat",
            "geosite": "/etc/xray/geosite.dat"
    },
    "soket web": {
     "diaktifkan": benar,
      "path": "/gandring-go",
       "host": "$domain"
    },
    "kaus kaki bayangan": {
     "diaktifkan": salah,
      "metode": "AES-128-GCM",
       "kata sandi": ""
    },
    "transport_plugin": {
     "diaktifkan": salah,
      "Tipe": "",
       "memerintah": "",
        "plugin_option": "",
         "arg": [],
          "env": []
    },
    "teruskan_proxy": {
     "diaktifkan": salah,
      "proxy_addr": "",
       "proxy_port": 0,
        "nama belakang": "",
         "kata sandi": ""
    },
    "mysql": {
     "diaktifkan": salah,
      "server_addr": "localhost",
       "server_port": 3306,
        "database": "",
         "nama belakang": "",
          "kata sandi": "",
           "check_rate": 60
    },
    "api": {
     "diaktifkan": benar,
      "api_addr": "127.0.0.1",
       "api_port": 10808,
        "ssl": {
         "enabled": true,
          "key": "/etc/xray/xray.key",
           "cert": "/etc/xray/xray.crt",
            "verify_client": false,
             "client_cert": []
    }
  }
}
END

cat <<EOF > /etc/systemd/system/trojan-go.service
[Unit]
Description=Trojan-Go Service Mod By zerossl
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
EOF

#cat <<EOF > /etc/trojan-go/uuid.txt
#$uuid
#EOF

# Starting
systemctl daemon-reload
systemctl enable trojan-go.service
systemctl start trojan-go
systemctl enable trojan-go@.service
systemctl start trojan-go

# Trojan Go Uuid
cat > /etc/trojan-go/uuid.txt << END
$uuid
END

sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2096 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2087 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8443 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2083 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2053 -j ACCEPT

sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2096 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2087 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8443 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2083 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2053 -j ACCEPT

sudo iptables -I INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -I INPUT -p udp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -I OUTPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
sudo iptables -I OUTPUT -p udp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p udp --dport 8443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 8443 -m conntrack --ctstate ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --sport 8443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save
sudo netfilter-persistent reload

cd
cp /root/domain /etc/xra

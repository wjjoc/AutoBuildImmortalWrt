#!/bin/sh
# 由妹宝生成：从爱快迁移到 ImmortalWrt 的局域网配置（首次开机执行一次）
# 源: ikuai_export.json | LAN=192.168.5.1 | 静态绑定 + 端口转发 + DHCP 池 + UPnP + IPv6

LOGFILE=/etc/config/meibao-migrate-log.txt
echo "meibao-migrate start $(date)" >>$LOGFILE

# ---- DHCP 地址池（爱快: 192.168.5.100-192.168.5.200，租期 120 分钟）----
uci set dhcp.lan.start='100'
uci set dhcp.lan.limit='101'
uci set dhcp.lan.leasetime='120m'
uci set dhcp.lan.dhcpv4='server'
uci set dhcp.lan.dhcp_option='6,223.5.5.5'
uci commit dhcp

# ---- 静态绑定 15 条（爱快原样搬，网关统一走主路由）----
uci add dhcp host
uci set dhcp.@host[-1].name='PC'
uci set dhcp.@host[-1].mac='a0:36:bc:29:c3:29'
uci set dhcp.@host[-1].ip='192.168.5.5'
uci add dhcp host
uci set dhcp.@host[-1].name='GEM'
uci set dhcp.@host[-1].mac='c8:ff:bf:00:68:55'
uci set dhcp.@host[-1].ip='192.168.5.6'
uci add dhcp host
uci set dhcp.@host[-1].name='AppleTV'
uci set dhcp.@host[-1].mac='48:e1:5c:7b:13:64'
uci set dhcp.@host[-1].ip='192.168.5.7'
uci add dhcp host
uci set dhcp.@host[-1].name='Phone'
uci set dhcp.@host[-1].mac='24:a4:87:ed:17:29'
uci set dhcp.@host[-1].ip='192.168.5.4'
uci add dhcp host
uci set dhcp.@host[-1].name='mangmi'
uci set dhcp.@host[-1].mac='f0:74:e4:85:2e:50'
uci set dhcp.@host[-1].ip='192.168.5.148'
uci add dhcp host
uci set dhcp.@host[-1].name='shufang_ac'
uci set dhcp.@host[-1].mac='3c:20:93:c4:22:09'
uci set dhcp.@host[-1].ip='192.168.5.122'
uci add dhcp host
uci set dhcp.@host[-1].name='keting_ac'
uci set dhcp.@host[-1].mac='04:d6:f4:68:57:82'
uci set dhcp.@host[-1].ip='192.168.5.112'
uci add dhcp host
uci set dhcp.@host[-1].name='zhuwo_ac'
uci set dhcp.@host[-1].mac='d4:84:57:a2:46:fe'
uci set dhcp.@host[-1].ip='192.168.5.121'
uci add dhcp host
uci set dhcp.@host[-1].name='ciwo_ac'
uci set dhcp.@host[-1].mac='04:d6:f4:65:9e:4f'
uci set dhcp.@host[-1].ip='192.168.5.120'
uci add dhcp host
uci set dhcp.@host[-1].name='zahuojian_ac'
uci set dhcp.@host[-1].mac='54:92:6a:21:10:02'
uci set dhcp.@host[-1].ip='192.168.5.137'
uci add dhcp host
uci set dhcp.@host[-1].name='xiwanji'
uci set dhcp.@host[-1].mac='04:d6:f4:19:c7:c2'
uci set dhcp.@host[-1].ip='192.168.5.114'
uci add dhcp host
uci set dhcp.@host[-1].name='ganyiji'
uci set dhcp.@host[-1].mac='a0:68:1c:f7:46:c4'
uci set dhcp.@host[-1].ip='192.168.5.101'
uci add dhcp host
uci set dhcp.@host[-1].name='bingxiang'
uci set dhcp.@host[-1].mac='d4:84:57:8d:6e:44'
uci set dhcp.@host[-1].ip='192.168.5.140'
uci add dhcp host
uci set dhcp.@host[-1].name='uzg01'
uci set dhcp.@host[-1].mac='80:f3:da:b8:c8:40'
uci set dhcp.@host[-1].ip='192.168.5.142'
uci add dhcp host
uci set dhcp.@host[-1].name='haos'
uci set dhcp.@host[-1].mac='e4:3a:6e:8c:6d:ab'
uci set dhcp.@host[-1].ip='192.168.5.10'
uci commit dhcp

# ---- 端口转发 17 条（爱快 18 条，跳过 1 条：Lucky 已改为主路由 host 网络）----
uci add firewall redirect
uci set firewall.@redirect[-1].name='qb-torrent'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp udp'
uci set firewall.@redirect[-1].src_dport='48892'
uci set firewall.@redirect[-1].dest_ip='192.168.5.3'
uci set firewall.@redirect[-1].dest_port='48892'
uci add firewall redirect
uci set firewall.@redirect[-1].name='tr-torrent'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp udp'
uci set firewall.@redirect[-1].src_dport='5444'
uci set firewall.@redirect[-1].dest_ip='192.168.5.3'
uci set firewall.@redirect[-1].dest_port='5444'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='47984'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='47984'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='47989'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='47989'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='47998'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='47998'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='47999'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='47999'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='48000'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='48000'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='48010'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='48010'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='57984'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='57984'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='57989'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='57989'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='57998'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='57998'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='57999'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='57999'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='58000'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='58000'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='58010'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='58010'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-gem-webui'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='57990'
uci set firewall.@redirect[-1].dest_ip='192.168.5.6'
uci set firewall.@redirect[-1].dest_port='57990'
uci add firewall redirect
uci set firewall.@redirect[-1].name='sunshine-pc-webui'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='tcp'
uci set firewall.@redirect[-1].src_dport='47990'
uci set firewall.@redirect[-1].dest_ip='192.168.5.5'
uci set firewall.@redirect[-1].dest_port='47990'
uci add firewall redirect
uci set firewall.@redirect[-1].name='wg-easy'
uci set firewall.@redirect[-1].target='DNAT'
uci set firewall.@redirect[-1].src='wan'
uci set firewall.@redirect[-1].proto='udp'
uci set firewall.@redirect[-1].src_dport='51820'
uci set firewall.@redirect[-1].dest_ip='192.168.5.2'
uci set firewall.@redirect[-1].dest_port='51820'
uci commit firewall

# ---- UPnP（内网 lan / 外网 wan）----
uci set upnpd.config.enabled='1'
uci set upnpd.config.enable_natpmp='1'
uci set upnpd.config.enable_upnp='1'
uci set upnpd.config.internal_iface='lan'
uci set upnpd.config.external_iface='wan'
uci set upnpd.config.secure_mode='1'
uci commit upnpd

# ---- IPv6（wan6 由上游 99-custom.sh 配 dhcpv6；lan 下发 /64）----
uci set network.lan.ip6assign='64'
uci set network.lan.ip6hint='0'
uci commit network

echo "meibao-migrate done: statics=15 dnats=17" >>$LOGFILE
exit 0

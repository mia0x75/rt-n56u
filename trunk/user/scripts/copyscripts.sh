#!/bin/sh
if [ ! -f "/etc/frp_script.sh" ] ; then
	cp -rf /etc_ro/frp_script.sh /etc/
	chmod 755 "/etc/frp_script.sh"
fi

mkdir -p /etc/smartdns.d
if [ ! -f "/etc/smartdns.d/address.conf" ] ; then
	cp -rf /etc_ro/address.conf /etc/smartdns.d/address.conf
	chmod 644 "/etc/smartdns.d/address.conf"
fi
if [ ! -f "/etc/smartdns.d/blacklist.conf" ] ; then
	cp -rf /etc_ro/blacklist.conf /etc/smartdns.d/blacklist.conf
	chmod 644 "/etc/smartdns.d/blacklist.conf"
fi
if [ ! -f "/etc/smartdns.d/whitelist.conf" ] ; then
	cp -rf /etc_ro/whitelist.conf /etc/smartdns.d/whitelist.conf
	chmod 644 "/etc/smartdns.d/whitelist.conf"
fi
if [ ! -f "/etc/smartdns.d/custom.conf" ] ; then
	cp -rf /etc_ro/custom.conf /etc/smartdns.d/custom.conf
	chmod 644 "/etc/smartdns.d/custom.conf"
fi
if [ ! -f "/etc/smartdns.d/blockad.conf" ] ; then
	cp -rf /etc_ro/blockad.conf /etc/smartdns.d/blockad.conf
	chmod 644 "/etc/smartdns.d/blockad.conf"
fi

if [ ! -f "/etc/ddns_script.sh" ] ; then
	cp -rf /etc_ro/ddns_script.sh /etc/
	chmod 755 "/etc/ddns_script.sh"
fi
#if [ ! -f "/etc/ss_dom.sh" ] ; then
#cp -rf /etc_ro/ss_dom.sh /etc/
#chmod 755 "/etc/ss_dom.sh"
#fi
#if [ ! -f "/etc/ss_ip.sh" ] ; then
#cp -rf /etc_ro/ss_ip.sh /etc/
#chmod 755 "/etc/ss_ip.sh"
#fi
#if [ ! -f "/etc/ss_lan_bip.sh" ] ; then
#cp -rf /etc_ro/ss_lan_bip.sh /etc/
#chmod 755 "/etc/ss_lan_bip.sh"
#fi
#if [ ! -f "/etc/ss_lan_ip.sh" ] ; then
#cp -rf /etc_ro/ss_lan_ip.sh /etc/
#chmod 755 "/etc/ss_lan_ip.sh"
#fi
#if [ ! -f "/etc/ss_wan_ip.sh" ] ; then
#cp -rf /etc_ro/ss_wan_ip.sh /etc/
#chmod 755 "/etc/ss_wan_ip.sh"
#fi
if [ ! -f "/etc/dnsmasq.oversea/oversea_list.conf" ] ; then
	mkdir -p /etc/dnsmasq.oversea
	cp -rf /etc_ro/oversea_list.conf /etc/dnsmasq.oversea/
	chmod 644 "/etc/dnsmasq.oversea/oversea_list.conf"
fi

if [ ! -f "/etc/gfwlist/gfwlist_list.conf" ] ; then
	mkdir -p /etc/gfwlist
	cp -rf /etc_ro/gfwlist_list.conf /etc/gfwlist/
	chmod 644 "/etc/gfwlist/gfwlist_list.conf"
fi

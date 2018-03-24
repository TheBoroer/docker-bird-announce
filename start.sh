#!/bin/sh

# Check if vars set
#if [ ! -z "$GIT_EMAIL" ]; then
#  
#fi

yes | cp -rf /etc/bird/bird6.template.conf /etc/bird/bird6.conf

# Setup IPv6 Bird
sed "s~_____ROUTER_ID_____~$ROUTER_ID~g" /etc/bird/bird6.conf
sed "s~_____ROUTER_ASN_____~$ROUTER_ASN~g" /etc/bird/bird6.conf
sed "s~_____ROUTER_IPV6_____~$ROUTER_IPV6~g" /etc/bird/bird6.conf
sed "s~_____ANNOUNCE_IPV6_____~$ANNOUNCE_IPV6~g" /etc/bird/bird6.conf
sed "s~_____PEER_ASN_____~$PEER_ASN~g" /etc/bird/bird6.conf
sed "s~_____PEER_IPV6_____~$PEER_IPV6~g" /etc/bird/bird6.conf

/usr/sbin/bird6 -f -u bird -g bird
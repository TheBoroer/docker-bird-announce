#!/bin/sh

if [ ! -z "$CONFIG_BIRD" ]; then
  # Setup IPv4 BIRD

  rm -rf /etc/bird/bird.conf
  yes | cp -rf /etc/bird/bird.template.conf /etc/bird/bird.conf

  for IP in $ANNOUNCE_IPV4
  do
    sed -i '/# _____ROUTES_PLACEHOLDER_____/a \ \ \ \ route '"$IP"' via '"$ROUTER_IPV4"';' /etc/bird/bird.conf
  done

  # Required Vars
  sed -i "s~_____ROUTER_ID_____~$ROUTER_ID~g" /etc/bird/bird.conf
  sed -i "s~_____ROUTER_ASN_____~$ROUTER_ASN~g" /etc/bird/bird.conf
  sed -i "s~_____ROUTER_IPV4_____~$ROUTER_IPV4~g" /etc/bird/bird.conf
  sed -i "s~_____ANNOUNCE_IPV4_____~$ANNOUNCE_IPV4~g" /etc/bird/bird.conf
  sed -i "s~_____PEER_ASN_____~$PEER_ASN~g" /etc/bird/bird.conf
  sed -i "s~_____PEER_IPV4_____~$PEER_IPV4~g" /etc/bird/bird.conf
  
  # Optional Vars
  if [ ! -z "$PASSWORD" ]; then
    sed -i "s~#_____PASSWORD_____~password \"$PASSWORD\";~g" /etc/bird/bird.conf
  fi
  
  if [ ! -z "$MULTIHOP" ]; then
    sed -i "s~#_____MULTIHOP_____~multihop $MULTIHOP;~g" /etc/bird/bird.conf
  fi
  
fi

if [ ! -z "$CONFIG_BIRD6" ]; then
  # Setup IPv6 BIRD

  rm -rf /etc/bird/bird6.conf
  yes | cp -rf /etc/bird/bird6.template.conf /etc/bird/bird6.conf

  for IP in $ANNOUNCE_IPV6
  do
    sed -i '/# _____ROUTES_PLACEHOLDER_____/a \ \ \ \ route '"$IP"' via '"$ROUTER_IPV6"';' /etc/bird/bird.conf
  done

  # Required Vars
  sed -i "s~_____ROUTER_ID_____~$ROUTER_ID~g" /etc/bird/bird6.conf
  sed -i "s~_____ROUTER_ASN_____~$ROUTER_ASN~g" /etc/bird/bird6.conf
  sed -i "s~_____ROUTER_IPV6_____~$ROUTER_IPV6~g" /etc/bird/bird6.conf
  sed -i "s~_____ANNOUNCE_IPV6_____~$ANNOUNCE_IPV6~g" /etc/bird/bird6.conf
  sed -i "s~_____PEER_ASN_____~$PEER_ASN~g" /etc/bird/bird6.conf
  sed -i "s~_____PEER_IPV6_____~$PEER_IPV6~g" /etc/bird/bird6.conf

  # Optional Vars
  if [ ! -z "$PASSWORD" ]; then
    sed -i "s~#_____PASSWORD_____~password \"$PASSWORD\";~g" /etc/bird/bird6.conf
  fi
  
  if [ ! -z "$MULTIHOP" ]; then
    sed -i "s~#_____MULTIHOP_____~multihop $MULTIHOP;~g" /etc/bird/bird6.conf
  fi

fi


if [ ! -z "$ENABLE_BIRD" ] && [ ! -z "$ENABLE_BIRD6" ]; then
  # BIRD v4 and v6
  /usr/sbin/bird6 -u root -g root
  /usr/sbin/bird -f -u root -g root

elif [ ! -z "$ENABLE_BIRD" ]; then
  # BIRD v4 only
  /usr/sbin/bird -f -u root -g root

elif [ ! -z "$ENABLE_BIRD6" ]; then
  # BIRD v6 only
  /usr/sbin/bird6 -f -u root -g root

else
  echo "Note: BIRD and BIRD6 is disabled. Exiting."
fi

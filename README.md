## Dockerized BIRD Internet Routing Daemon

More information on BIRD: http://bird.network.cz

This container is for setting up quick and easy BIRD container to BGP announce an IPv6 Block.
It's configured via the environment variables below.

# Requirements to run Container
- Run in Priviledged mode
- Network mode: Host

## Environment Variables

All of these variables are required to start 

| Environment Variable | Description | Example Value |
|----------------------|-------------|---------------|
| ROUTER_ID | Change this into your BIRD router ID. It's a world-wide unique identification # of this router/server, usually one of public IPv4 addresses. | `1.1.1.1` |
| ROUTER_ASN | Your AS Number | `111111` |
| ROUTER_IPV6 | Your Router's IPv6 address | `2001:100:af00c:88::2` |
| ANNOUNCE_IPV6 | Your IPv6 block you want to announce  | `2f01:a8f1:1200::/44` |
| PEER_ASN | Your Peering Partner's AS Number | `222222` |
| PEER_IPV6 | Your Peering Partner's BGP Router IPv6 address |  `2001:a50:9f01c:a288::1` |
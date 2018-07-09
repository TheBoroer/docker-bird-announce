## Dockerized BIRD Internet Routing Daemon

More information on BIRD: http://bird.network.cz

This container is for setting up quick and easy BIRD container to BGP announce an IPv4 and/or IPv6 Block.
It's configured via the environment variables below.

# Requirements to run Container
- Run in Priviledged mode
- Network mode: Host

# Environment Variables

All of these variables are required to start 

| Environment Variable | Description | Example Value |
|----------------------|-------------|---------------|
| ROUTER_ID | Change this into your BIRD router ID. It's a world-wide unique identification # of this router/server, usually one of public IPv4 addresses. | `1.1.1.1` |
| ROUTER_ASN | Your AS Number | `111111` |
| PEER_ASN | Your Peering Partner's AS Number | `222222` |
| ENABLE_BIRD | Enable the BIRD IPv4 Daemon | `true` |
| CONFIG_BIRD | Generate BIRD config on boot using the ENV Vars (**NOTE:** this will overwrite any volume mounted config file) | `true` |
| ROUTER_IPV4 | Your Router's IPv4 address | `123.123.123.1` |
| ANNOUNCE_IPV4 | Your IPv4 block you want to announce  | `2.2.2.0/24` |
| PEER_IPV4 | Your Peering Partner's BGP Router IPv4 address |  `3.3.3.3` |
| ENABLE_BIRD6 | Enable the BIRD IPv6 Daemon | `true` |
| CONFIG_BIRD | Generate BIRD6 config on boot using the ENV Vars (**NOTE**: this will overwrite any volume mounted config file) | `true` |
| ROUTER_IPV6 | Your Router's IPv6 address | `2001:100:af00c:88::2` |
| ANNOUNCE_IPV6 | Your IPv6 block you want to announce  | `2f01:a8f1:1200::/48` |
| PEER_IPV6 | Your Peering Partner's BGP Router IPv6 address |  `2001:a50:9f01c:a288::1` |

# Useful commands to run inside the container

Show Routes announced via BGP:
- `birdc6 show route`

Show BGP Status for only the bgp announced (ba) block:
- `birdc6 show proto ba`

Show BGP Status for everything:
- `birdc6 show proto all`

# Contribute

Pull Requests are always welcome. Let's connect!

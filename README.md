## Dockerized BIRD Internet Routing Daemon

![Docker Build Status](https://img.shields.io/docker/build/boro/bird-announce.svg) ![Docker Automated build](https://img.shields.io/docker/automated/boro/bird-announce.svg) ![MicroBadger Size](https://img.shields.io/microbadger/image-size/boro/bird-announce/latest.svg)

![Docker Pulls](https://img.shields.io/docker/pulls/boro/bird-announce.svg) ![Docker Stars](https://img.shields.io/docker/stars/boro/bird-announce.svg)

More information on BIRD: http://bird.network.cz

This container is for setting up quick and easy BIRD container to BGP announce an IPv4 and/or IPv6 Block.
It's configured via the environment variables below.

# Requirements to run Container
- Run in Privileged mode
- Network mode: Host

# Environment Variables

All of these variables are required to start

### Common (shared between IPv4 and IPv6)
| Environment Variable | Description | Example Value |
|----------------------|-------------|---------------|
| `ROUTER_ID` | Change this into your BIRD router ID. It's a world-wide unique identification # of this router/server, usually one of public IPv4 addresses. | `123.123.123.1` |
| `PASSWORD` | Your BGP Session Password | `secretpassword` |
| `MULTIHOP` | Number of muliihop sessions | `2` |
| `PEER_ASN` | Your Peering Partner's AS Number | `222222` |

### IPv4 Specific
| Environment Variable | Description | Example Value |
|----------------------|-------------|---------------|
| `ENABLE_BIRD` | Enable the BIRD IPv4 Daemon | `true` |
| `CONFIG_BIRD` | Generate BIRD config on boot using the ENV Vars (**NOTE:** this will overwrite any volume mounted config file) | `true` |
| `ROUTER_IPV4` | Your Router's IPv4 address | `123.123.123.1` |
| `PEER_IPV4` | Your Peering Partner's BGP Router IPv4 address |  `3.3.3.3` |
| `ANNOUNCE_IPV4` | Your IPv4 block (or multiple blocks separated by a space) you want to announce  | `2.2.2.0/24` or `2.2.2.0/24 2.2.2.1/32` |

### IPv6 Specific
| Environment Variable | Description | Example Value |
|----------------------|-------------|---------------|
| `ENABLE_BIRD6` | Enable the BIRD IPv6 Daemon | `true` |
| `CONFIG_BIRD` | Generate BIRD6 config on boot using the ENV Vars (**NOTE**: this will overwrite any volume mounted config file) | `true` |
| `ROUTER_IPV6` | Your Router's IPv6 address | `2001:100:af00c:88::2` |
| `PEER_IPV6` | Your Peering Partner's BGP Router IPv6 address |  `2001:a50:9f01c:a288::1` |
| `ANNOUNCE_IPV6` | Your IPv6 block (or multiple blocks separated by a space) that you want to announce. | `2f01:a8f1:1200::/48` or `2f01:a8f1:1200::/48 2f01:a8f1:1201::/48` |


# Useful commands to run inside the container

Show Routes announced via BGP:
- `birdc show route`
- `birdc6 show route`

Show BGP Status for only the bgp announced (ba) block:
- `birdc show proto ba`
- `birdc6 show proto ba`

Show BGP Status for everything:
- `birdc show proto all`
- `birdc6 show proto all`

# Contribute

Pull Requests are always welcome. Let's connect!

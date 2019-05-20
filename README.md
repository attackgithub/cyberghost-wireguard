# CyberGhost WireGuard Client

This docker container will allow you to create a VPN connection to CyberGhost WireGuard VPN servers.

Get your `device_id` and `token` from https://gen4.xyz

Usage:

```
docker run --rm  \
  --net=host \
  --cap-add=NET_ADMIN \
  --env WG_SERVER_IP=ip \
  --env WG_DEVICE=device_id \
  --env WG_TOKEN=token \
  registry.gitlab.com/gun1x/cyberghost-wireguard
```

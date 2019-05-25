# [CyberGhost WireGuard Client](https://gitlab.com/gun1x/cyberghost-wireguard/)

*First of all, your kernel must support wireguard, so head over to https://www.wireguard.com/install/ and install wireguard for your distribution.* 

This docker container will allow you to create a VPN connection to CyberGhost WireGuard VPN servers.

Get the current server list and your `device/token` from https://gen4.xyz

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

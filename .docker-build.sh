#!/bin/bash
docker build -t registry.gitlab.com/gun1x/cyberghost-wireguard .
docker push registry.gitlab.com/gun1x/cyberghost-wireguard
docker tag registry.gitlab.com/gun1x/cyberghost-wireguard gunix/cyberghost-wireguard:latest
docker push gunix/cyberghost-wireguard:latest

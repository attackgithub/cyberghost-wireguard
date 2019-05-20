#!/bin/bash
docker build -t registry.gitlab.com/gun1x/cyberghost-wireguard .
docker push registry.gitlab.com/gun1x/cyberghost-wireguard

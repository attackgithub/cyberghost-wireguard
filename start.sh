#!/bin/bash

command="env | grep WG_SERVER_IP_PORT && \
  env | grep WG_DEVICE && 
  env | grep WG_TOKEN"

if [ ! "$command" ]; then
  echo "this script requires 3 env vars:"
  echo WG_SERVER_IP
  echo WG_DEVICE
  echo WG_TOKEN
exit 1
fi

echo "nameserver 9.9.9.9" > /etc/resolv.conf

{
  privKey="$(wg genkey)"
  export privKey
  pubKey="$( echo "$privKey" | wg pubkey)"
  export pubKey
  json="$(curl -s -k -G \
    --user "${WG_DEVICE}:${WG_TOKEN}" \
    --data-urlencode "pubkey=$pubKey" \
    "https://${WG_SERVER_IP}:31337/addKey" )"
  export json
  
  if [ "$(echo "$json" | jq -r '.status')" == "OK" ]; then
    echo "
  [Interface]
  Address = $(echo "$json" | jq -r '.peer_ip')
  DNS = 9.9.9.9 8.8.8.8
  PrivateKey = $privKey
  
  [Peer]
  PublicKey = $(echo "$json" | jq -r '.server_key')
  AllowedIPs = 0.0.0.0/0
  Endpoint = ${WG_SERVER_IP}:$(echo "$json" | jq -r '.server_port')
  "
  else
    >&2 echo "Server did not return OK. Here is the output:"
    >&2 echo "$json"
    exit 1
  fi
} > /etc/wireguard/test.conf
wg-quick up test

while true
do
  echo "you should be doing some awesome shit instead of watching these logs..."
  sleep 1000
done


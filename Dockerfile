FROM alpine:edge
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache bash iptables wireguard-tools iproute2 curl jq

COPY start.sh /start.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/start.sh"]

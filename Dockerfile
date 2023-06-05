FROM alpine:3.10.1

RUN apk add --update bash socat

COPY udp-proxy.sh /usr/bin/udp-proxy

ENTRYPOINT ["udp-proxy"]

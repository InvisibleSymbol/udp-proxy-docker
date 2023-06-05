#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "usage: $(basename $0) host port"
    exit 1
fi

HOST="$1"
PORT="$2"

LISTEN_PORT=${LISTEN_PORT:-${PORT}}

echo "relay UDP/IP connections on :${LISTEN_PORT} to ${HOST}:${PORT}"
exec socat UDP4-RECVFROM:${LISTEN_PORT},fork,reuseaddr UDP4-SENDTO:${HOST}:${PORT}

#!/bin/sh

set -eou pipefail

wg-quick up /etc/wireguard/vpn.conf

exec /go/bin/socks5-server

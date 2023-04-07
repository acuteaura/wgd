# wgd

Painless wireguard that...

* doesn't mess with your network stack
* works on macOS with colima
* exposes the target network via SOCKS5 for easy browser-side routing

```shell
docker build -t local/wgd .
docker run -p 1081:1080 -v (pwd)/any-wireguard-config-here.conf:/etc/wireguard/vpn.conf --privileged --rm local/wgd:latest
```

You can now use FoxyProxy ([Chrome](https://chrome.google.com/webstore/detail/foxyproxy-standard/gcknhkkoolaabfmlnjonogaaifnjlfnp), [Firefox](https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/)) or your other favorite browser addon to route some hosts/patterns to the socks proxy at `localhost:1080`.

## Limitations

IPv6 may not be supported on the host, depending on your docker setup. If you get `RTNETLINK answers: Permission denied`, this is likely the 
case.

See this [issue](https://github.com/abiosoft/colima/issues/583#issuecomment-1475815113) for support in colima.

# Why are you using privileged mode

Because `wg-quick` might need access to sysctl.

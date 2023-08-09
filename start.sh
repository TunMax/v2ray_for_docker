#!/bin/bash
/bz/caddy start --config /bz/Caddyfile
exec /bz/v2ray -config /bz/config.json

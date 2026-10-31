#!/bin/sh
set -eu

if [ -n "${CLOUDFLARE_TUNNEL_TOKEN:-}" ]; then
  echo "Starting Cloudflared tunnel..."
  /usr/local/bin/cloudflared tunnel --no-autoupdate run --token "${CLOUDFLARE_TUNNEL_TOKEN}" &
else
  echo "CLOUDFLARE_TUNNEL_TOKEN not set; running Dozzle without Cloudflare."
fi

exec /dozzle
# Dozzle + Cloudflare Tunnel

Single-image container with Dozzle and Cloudflare Tunnel.

## Local run
```bash
cp .env.example .env
docker compose up -d
```

Open:
- http://localhost:8099

## GHCR image
- ghcr.io/xerzo/dozzle-cloudflared:latest

## Cloudflare
Add your token to `.env`:
```env
CLOUDFLARE_TUNNEL_TOKEN=...
```

This starts both Dozzle and Cloudflare Tunnel inside one container.

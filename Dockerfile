FROM amir20/dozzle:main-alpine

RUN apk add --no-cache ca-certificates bash curl && \
    ARCH=$(uname -m) && \
    case "$ARCH" in \
      x86_64) CLOUDFLARED_ARCH=amd64 ;; \
      aarch64) CLOUDFLARED_ARCH=arm64 ;; \
      *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -fsSL "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${CLOUDFLARED_ARCH}" -o /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV DOZZLE_LEVEL=info \
    DOZZLE_HOSTNAME=DragonX \
    DOZZLE_ENABLE_ACTIONS=false \
    DOZZLE_ENABLE_SHELL=false \
    DOZZLE_NO_ANALYTICS=true

EXPOSE 8080
ENTRYPOINT ["/start.sh"]

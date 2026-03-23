FROM caddy:builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/namecheap \
  --with github.com/grafana/certmagic-gcs

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

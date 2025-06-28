FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    libc6 \
    libstdc++6 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
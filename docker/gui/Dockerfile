FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  qmake6 \
  qt6-base-dev \
  qt6-base-dev-tools \
  qt6-tools-dev \
  qt6-tools-dev-tools \
  qt6-l10n-tools \
  qt6-declarative-dev \
  libqt6svg6-dev \
  libqt6printsupport6 \
  graphviz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    qtcreator \
    qt6-base-dev \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    qt6-base-dev-tools \
    qt6-l10n-tools \
    qt6-declarative-dev \
    libqt6opengl6-dev \
    libqt6core6 \
    libqt6gui6 \
    libqt6widgets6 \
    libqt6svg6-dev \
    libqt6printsupport6 \
    build-essential \
    cmake \
    qmake6 \
    git \
    gdb \
    x11-apps \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    graphviz \
    fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY docker/qt/entry.sh /entry.sh
RUN chmod +x /entry.sh

ENTRYPOINT [ "/entry.sh" ] 
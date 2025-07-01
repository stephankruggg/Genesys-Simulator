FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    qtcreator \
    qt6-base-dev \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    libqt6opengl6-dev \
    libqt6core6 \
    libqt6gui6 \
    libqt6widgets6 \
    build-essential \
    cmake \
    git \
    gdb \
    x11-apps \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Configuração para suporte a X11/GUI
ENV QT_X11_NO_MITSHM=1
ENV DISPLAY=:0
ENV QT_QUICK_BACKEND=software 
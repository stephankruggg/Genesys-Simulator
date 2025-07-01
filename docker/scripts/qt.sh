#!/bin/bash

set -e

# Caminho absoluto da raiz do projeto (um nível acima de docker/scripts)
GENESYS_ROOT=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")

# Caminho do binário dentro do container
CONTAINER_PATH=/app

# Caminho do projeto Qt dentro do container
QT_PROJECT_PATH="$CONTAINER_PATH/source/applications/gui/qt/GenesysQtGUI/GenesysQtGUI.pro"

# Nome da imagem
IMAGE_NAME=genesys-qt

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/qt/Dockerfile"

# Build
echo "🔧 Construindo imagem Docker para o QtCreator..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT"

# Configuração para X11 (permitir acesso ao display)
xhost +local:docker

# Execução
echo "🚀 Executando QtCreator com projeto GenesysQtGUI..."
docker run --rm -ti \
  --cpus="2" \
  --memory="8g" \
  --net=host \
  --ipc=host \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e QT_QUICK_BACKEND=software \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  -w "$CONTAINER_PATH" \
  "$IMAGE_NAME" qtcreator "$QT_PROJECT_PATH"

# Restaurar configuração do X11
xhost -local:docker
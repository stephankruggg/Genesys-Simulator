#!/bin/bash

set -e

# Caminho absoluto da raiz do projeto (um nível acima de docker/scripts)
GENESYS_ROOT=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")

# Caminho do binário dentro do container
CONTAINER_PATH=/app
GUI_BIN_PATH=$CONTAINER_PATH/projects/GenesysQtGUI/GenesysQtGUI/build/release/GenesysQtGUI

# Nome da imagem
IMAGE_NAME=genesys-gui

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/gui/Dockerfile"

# Permite que containers acessem o servidor X11 (apenas se necessário)
echo "🔓 Permitindo acesso ao servidor X11..."
xhost +local:docker

# Build
echo "🔧 Construindo imagem Docker para o modo GUI..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT" --rm

# Execução
echo "🚀 Executando GenESyS GUI..."
docker run --rm -ti \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  "$IMAGE_NAME" "$GUI_BIN_PATH"

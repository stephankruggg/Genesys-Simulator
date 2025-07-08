#!/bin/bash

set -e

source "$(realpath "$(dirname "${BASH_SOURCE[0]}")/config.sh")"

# Nome da imagem
IMAGE_NAME=genesys-gui

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/gui/Dockerfile"

# Condicionalmente baixa a versão mais recente do código do GenESyS
if [ "$PULL" -eq 1 ]; then
  echo "🌐 Baixando a versão mais recente do código do GenESyS"
  git fetch origin
  git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
fi

# Permite que containers acessem o servidor X11 (apenas se necessário)
echo "🔓 Permitindo acesso ao servidor X11..."
xhost +local:docker

# Build
echo "🔧 Construindo imagem Docker para o modo GUI..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT" --rm

# Execução
echo "🚀 Iniciando GenESyS GUI..."
docker run --rm -ti \
  -e DISPLAY=$DISPLAY \
  -e RECOMPILE=$RECOMPILE \
  -e GENESYS_GUI_PRO_PATH=$GENESYS_GUI_PRO_PATH \
  -e GENESYS_GUI_RELEASE_SUBPATH=$GENESYS_GUI_RELEASE_SUBPATH \
  -e GENESYS_GUI_MAKEFILE_PATH=$GENESYS_GUI_MAKEFILE_PATH \
  -e GENESYS_GUI_EXECUTABLE_PATH=$GENESYS_GUI_EXECUTABLE_PATH \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  "$IMAGE_NAME"

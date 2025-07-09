#!/bin/bash

set -e

source "$(realpath "$(dirname "${BASH_SOURCE[0]}")/config.sh")"

# Nome da imagem
IMAGE_NAME=genesys-qt

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/qt/Dockerfile"

# Condicionalmente baixa a versão mais recente do código do GenESyS
if [ "$PULL" -eq 1 ]; then
  echo "🌐 Baixando a versão mais recente do código do GenESyS"
  git fetch origin
  git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
fi

# Configuração para X11 (permitir acesso ao display)
xhost +local:docker

# Build
echo "🔧 Construindo imagem Docker para o QtCreator..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT"

# Execução
echo "🚀 Executando QtCreator com projeto GenesysQtGUI..."
docker run --rm -ti \
  --cpus="2" \
  --memory="8g" \
  --net=host \
  --ipc=host \
  -e DISPLAY=$DISPLAY \
  -e RECOMPILE=$RECOMPILE \
  -e GENESYS_QT_PRO_PATH=$GENESYS_QT_PRO_PATH \
  -e GENESYS_QT_RELEASE_SUBPATH=$GENESYS_QT_RELEASE_SUBPATH \
  -e GENESYS_QT_MAKEFILE_PATH=$GENESYS_QT_MAKEFILE_PATH \
  -e GENESYS_QT_EXECUTABLE_PATH=$GENESYS_QT_EXECUTABLE_PATH \
  -e QT_X11_NO_MITSHM=1 \
  -e QT_QUICK_BACKEND=software \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  -w "$CONTAINER_PATH" \
  "$IMAGE_NAME" qtcreator "$GENESYS_QT_PRO_PATH"

# Restaurar configuração do X11
xhost -local:docker
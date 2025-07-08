#!/bin/bash

set -e

# Configurações de ambiente
source "$(realpath "$(dirname "${BASH_SOURCE[0]}")/config.sh")"

# Nome da imagem
IMAGE_NAME=genesys-shell

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/shell/Dockerfile"

# Condicionalmente baixa a versão mais recente do código do GenESyS
if [ "$PULL" -eq 1 ]; then
  echo "🌐 Baixando a versão mais recente do código do GenESyS"
  git fetch origin
  git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
fi

# Build
echo "🔧 Construindo imagem Docker para o modo Shell..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT" --rm

# Execução
echo "🚀 Iniciando GenESyS Shell..."
docker run --rm -ti \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  -e RECOMPILE=$RECOMPILE \
  -e GENESYS_SHELL_MAKEFILE_PATH=$GENESYS_SHELL_MAKEFILE_PATH \
  -e GENESYS_SHELL_EXECUTABLE_PATH=$GENESYS_SHELL_EXECUTABLE_PATH \
  "$IMAGE_NAME"

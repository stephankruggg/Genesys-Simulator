#!/bin/bash

set -e

# Caminho absoluto da raiz do projeto (um nível acima de docker/scripts)
GENESYS_ROOT=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")

# Caminho do binário dentro do container
CONTAINER_PATH=/app
SHELL_BIN_PATH=$CONTAINER_PATH/projects/GenesysTerminalApplication/dist/GenesysShell

# Nome da imagem
IMAGE_NAME=genesys-shell

# Caminho do Dockerfile
DOCKERFILE="$GENESYS_ROOT/docker/shell/Dockerfile"

# Build
echo "🔧 Construindo imagem Docker para o modo Shell..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$GENESYS_ROOT"

# Execução
echo "🚀 Executando GenESyS Shell..."
docker run --rm -ti \
  -v "$GENESYS_ROOT":"$CONTAINER_PATH" \
  "$IMAGE_NAME" "$SHELL_BIN_PATH"
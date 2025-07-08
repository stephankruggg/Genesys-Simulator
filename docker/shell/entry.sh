#!/bin/bash
set -e

# Condicionalmente recompila o código
if [ "$RECOMPILE" = "1" ]; then
  echo "🔄 Recompilando o GenESyS Shell..."
  make -f "$GENESYS_SHELL_MAKEFILE_PATH" build
fi

# Executa o binário
echo "🚀 Executando GenESyS Shell..."
exec "$GENESYS_SHELL_EXECUTABLE_PATH"

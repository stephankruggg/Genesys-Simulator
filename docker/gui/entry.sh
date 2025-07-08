#!/bin/bash
set -e

# Verifica se deve recompilar o código
if [ "$RECOMPILE" = "1" ]; then
  echo "🔄 Recompilando o GenESyS GUI..."
  qmake6 "$GENESYS_GUI_PRO_PATH" -o "$GENESYS_GUI_MAKEFILE_PATH"
  make -C "$GENESYS_GUI_RELEASE_SUBPATH"
fi

# Executa o binário
echo "🚀 Executando GenESyS GUI..."
exec "$GENESYS_GUI_EXECUTABLE_PATH"

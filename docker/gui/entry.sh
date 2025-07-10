#!/bin/bash
set -e

# Verifica se deve recompilar o código
if [ "$RECOMPILE" = "1" ]; then
  echo "🔄 Recompilando o GenESyS GUI..."
  cd "$GENESYS_GUI_RELEASE_SUBPATH"
  qmake6 "../../GenesysQtGUI.pro"
  make
  cd ~
fi

# Executa o binário
echo "🚀 Executando GenESyS GUI..."
exec "$GENESYS_GUI_EXECUTABLE_PATH"

#!/bin/bash
set -e

# Verifica se deve recompilar o código
if [ "$RECOMPILE" = "1" ]; then
  echo "🔄 Recompilando o GenESyS Qt..."
  qmake6 "$GENESYS_QT_PRO_PATH"
  make -C "$GENESYS_QT_RELEASE_SUBPATH"
fi

# Executa os argumentos passados para o container
echo "🚀 Executando: $@"
exec "$@"
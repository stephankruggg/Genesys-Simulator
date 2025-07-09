SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.sh"
source "$CONFIG_FILE"

while true
do
read -p "
Painel do Desenvolvedor: O que deseja fazer?
.............................
1. Abrir IDE do GenESyS (QtCreator) via Docker
2. Habilitar pull do repositório via Docker
3. Habilitar recompilação do código via Docker
4. Realizar pull do repositório localmente
5. Recompilar o código Shell localmente
6. Recompilar o código GUI localmente
7. Recompilar o código IDE QtCreator localmente
8. Baixar dependências GenESyS Shell localmente
9. Baixar dependências GenESyS GUI localmente
10. Baixar dependências GenESyS IDE QtCreator localmente
11. Executar o GenESyS Shell localmente
12. Executar o GenESyS GUI localmente
13. Executar o GenESyS IDE QtCreator localmente
14. Sair da aplicação
> " input

    if [ "$input" == "14" ]; then
        break
    fi

    case "$input" in
        "1")
          echo "🛠️ Abrindo QtCreator..."
          bash ./scripts/qt.sh
          ;;
        "2")
          echo "🔄 Pull ativado para execução via Docker."
          sed -i 's/^PULL=.*/PULL=1/' "$CONFIG_FILE"
          ;;
        "3")
          echo "🧱 Recompilação ativada para execução via Docker."
          sed -i 's/^RECOMPILE=.*/RECOMPILE=1/' "$CONFIG_FILE"
          ;;
        "4")
          echo "🌐 Baixando a versão mais recente do código do GenESyS..."
          git fetch origin
          git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
          ;;
        "5")
          echo "⚙️ Recompilando o GenESyS Shell..."
          make -f "../$GENESYS_SHELL_MAKEFILE_PATH" build
          ;;
        "6")
          echo "⚙️ Recompilando o GenESyS GUI..."
          qmake6 "../$GENESYS_GUI_PRO_PATH" -o "../$GENESYS_GUI_MAKEFILE_PATH"
          make -C "../$GENESYS_GUI_RELEASE_SUBPATH"
          ;;
        "7")
          echo "⚙️ Recompilando o GenESyS IDE QtCreator..."
          qmake6 "../$GENESYS_QT_PRO_PATH" -o "../$GENESYS_QT_MAKEFILE_PATH"
          make -C "../$GENESYS_QT_RELEASE_SUBPATH"
          ;;
        "8")
          echo "📥 Baixando dependências GenESyS Shell localmente..."
          bash ./scripts/local/shell.sh
          ;;
        "9")
          echo "📥 Baixando dependências GenESyS GUI localmente..."
          bash ./scripts/local/gui.sh
          ;;
        "10")
          echo "📥 Baixando dependências GenESyS IDE QtCreator localmente..."
          bash ./scripts/local/qt.sh
          ;;
        "11")
          echo "🚀 Iniciando GenESyS Shell localmente..."
          exec "../$GENESYS_SHELL_EXECUTABLE_PATH"
          ;;
        "12")
          echo "🚀 Iniciando GenESyS GUI localmente..."
          exec "../$GENESYS_GUI_EXECUTABLE_PATH"
          ;;
        "13")
          echo "🚀 Iniciando GenESyS IDE QtCreator localmente..."
          exec qtcreator "../$GENESYS_QT_PRO_PATH"
          ;;
        *)
          echo -e "\nOpção inválida."
          ;;
    esac
done

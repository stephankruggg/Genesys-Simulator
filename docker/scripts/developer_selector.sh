SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.sh"
source "$CONFIG_FILE"

while true
do
read -p "
Painel do Desenvolvedor: O que deseja fazer?
.............................
1. Abrir IDE do GenESyS (QtCreator)
2. Habilitar pull do repositório via Docker
3. Habilitar recompilação do código via Docker
4. Realizar pull do repositório localmente
5. Recompilar o código Shell localmente
6. Recompilar o código GUI localmente
7. Sair da aplicação
> " input

    if [ "$input" == "7" ]; then
        break
    fi

    case "$input" in
        "1")
          bash ./scripts/qt.sh
          ;;
        "2")
          echo "✅ Pull ativado para execução via Docker."
          sed -i 's/^PULL=.*/PULL=1/' "$CONFIG_FILE"
          ;;
        "3")
          echo "✅ Recompilação ativada para execução via Docker."
          sed -i 's/^RECOMPILE=.*/RECOMPILE=1/' "$CONFIG_FILE"
          ;;
        "4")
          echo "🌐 Baixando a versão mais recente do código do GenESyS"
          git fetch origin
          git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
          ;;
        "5")
          echo "🔄 Recompilando o GenESyS Shell..."
          make -f "../$GENESYS_SHELL_MAKEFILE_PATH" build
          ;;
        "6")
          echo "🔄 Recompilando o GenESyS GUI..."
          qmake6 "../$GENESYS_GUI_PRO_PATH" -o "../$GENESYS_GUI_MAKEFILE_PATH"
          make -C "../$GENESYS_GUI_RELEASE_SUBPATH"
          ;;
        *)
          echo -e "\nOpção inválida."
          ;;
    esac
done

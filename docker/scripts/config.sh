### Configurações de Ambiente

# Caminho do binário dentro do container
CONTAINER_PATH=/app

# Caminho absoluto da raiz do projeto (um nível acima de docker/scripts)
GENESYS_ROOT=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")

# Path para execução do GenESyS Shell
GENESYS_SHELL_SUBPATH=projects/GenesysTerminalApplication
GENESYS_SHELL_MAKEFILE_PATH=$GENESYS_SHELL_SUBPATH/Makefile
GENESYS_SHELL_EXECUTABLE_PATH=$GENESYS_SHELL_SUBPATH/dist/GenesysShell

# Paths para execução do GenESyS GUI
GENSYS_GUI_SUBPATH=source/applications/gui/qt/GenesysQtGUI
GENESYS_GUI_PRO_PATH=$GENSYS_GUI_SUBPATH/GenesysQtGUI.pro
GENESYS_GUI_RELEASE_SUBPATH=$GENSYS_GUI_SUBPATH/build/release/
GENSYS_GUI_MAKEFILE_PATH=$GENESYS_GUI_RELEASE_SUBPATH/Makefile
GENESYS_GUI_EXECUTABLE_PATH=$GENESYS_GUI_RELEASE_SUBPATH/GenesysQtGUI


### Configurações de Usuário

# Se a execução deve buscar o código mais recente (1 - buscar, 0 - não buscar)
PULL=0

# Se a execução deve recompilar o código (1 - recompilar, 0 - não recompilar)
RECOMPILE=0

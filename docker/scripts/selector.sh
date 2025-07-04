while true
do
read -p "
Menu: O que deseja executar?
.............................
1. GenESyS GUI
2. GenESyS Shell
3. IDE do GenESyS (QtCreator)
4. Sair da aplicação
> " input

    if [ "$input" == "4" ]; then
        break
    fi

    case "$input" in
        "1")
        bash ./scripts/gui.sh
        ;;
        "2")
        bash ./scripts/shell.sh
        ;;
        "3")
        bash ./scripts/qt.sh
        ;;
        *)
        echo -e "\nOpção inválida."
        ;;
    esac
done

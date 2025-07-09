# GenESyS

O GenESyS (Generic and Expansible System Simulator) é um simulador de eventos voltado para modelagem e análise de processos, semelhante ao conhecido software Arena. Ele permite representar visualmente fluxos de trabalho e sistemas produtivos, simulando seu comportamento ao longo do tempo.

## Funcionamento

O GenESyS possui duas formas de funcionamento:
- Aplicação de terminal (Shell)
- Aplicação de interface gráfica (GUI)

Para cada formato, o projeto fornece mecanismos para a execução remota (via Docker) e local (painel do desenvolvedor).

## Execução remota (via Docker)

### GUI

Para a execução da aplicação de interface gráfica via Docker, basta seguir o seguinte passo a passo:

1. Entrar no diretório do docker:
```bash
cd docker
```

2. Iniciar o menu de seleção:
```bash
make selector
```

3. No menu de seleção, escolher a opção 2 (Shell):
```bash
Menu: O que deseja abrir?
.............................
1. GenESyS GUI
2. GenESyS Shell
3. Painel do Desenvolvedor
4. Sair da aplicação
> 1
```

Essa opção irá instalar a imagem Docker necessária e iniciar automaticamente o container com a GUI do GenESyS.

### Shell

Para a execução da aplicação de terminal via Docker, basta seguir o seguinte passo a passo:

1. Entrar no diretório do docker:
```bash
cd docker
```

2. Iniciar o menu de seleção:
```bash
make selector
```

3. No menu de seleção, escolher a opção 2 (Shell):
```bash
Menu: O que deseja abrir?
.............................
1. GenESyS GUI
2. GenESyS Shell
3. Painel do Desenvolvedor
4. Sair da aplicação
> 2
```

Essa opção irá instalar a imagem Docker necessária e iniciar automaticamente o container com o Shell do GenESyS.

### Configurações

Algumas opções adicionais podem ser configuradas no arquivo `config.sh`, localizado dentro do diretório `docker`:

```bash
# Indica se antes da execução deve-se buscar o código mais recente via git (1 - buscar, 0 - não buscar)
PULL=0

# Indica se antes da execução deve-se recompilar o código do shell ou GUI (1 - recompilar, 0 - não recompilar)
RECOMPILE=0
```

Essas variáveis controlam se o projeto será atualizado e recompilado automaticamente antes da execução.

## Painel do Desenvolvedor

O painel do desenvolvedor permite ao desenvolvedor do GenESyS realizar uma série de ações para facilitar o desenvolvimento, dentre elas:
- Abrir a IDE de desenvolvimento QtCreator via Docker
- Habilitar pull do repositório ou recompilação do código via Docker
- Realizar pull do repositório localmente
- Recompilar o código localmente (para Shell, GUI ou QtCreator)
- Baixar dependências localmente (para Shell, GUI ou QtCreator)
- Executar o GenESyS localmente (via Shell, GUI ou QtCreator)

Para escolher a opção desejada, basta seguir o seguinte passo a passo:

1. Entrar no diretório do docker:
```bash
cd docker
```

2. No menu de seleção, escolher a opção 3 (Painel do Desenvolvedor):
```bash
Menu: O que deseja abrir?
.............................
1. GenESyS GUI
2. GenESyS Shell
3. Painel do Desenvolvedor
4. Sair da aplicação
> 3
```

3. Escolher a opção desejada no painel:
```bash
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
>
```

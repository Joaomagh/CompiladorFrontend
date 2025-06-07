# Compilador Frontend

## Visão Geral do Projeto

Este projeto implementa o frontend de um compilador, focando na análise léxica e sintática de uma linguagem simples. Utilizando ferramentas como JFlex e CUP, o compilador realiza a leitura de um código-fonte, identifica os tokens e verifica se a sintaxe está correta conforme a gramática definida.

## Componentes e Arquitetura do Projeto

- **Análise Léxica:** Utiliza o JFlex para gerar um scanner que lê o código-fonte e identifica os tokens válidos.
- **Análise Sintática:** Utiliza o CUP para gerar um parser que verifica se a sequência de tokens segue as regras gramaticais definidas.
- **Processamento de arquivos de entrada:** O compilador lê o código-fonte a partir de um arquivo texto e produz mensagens de erro ou confirma a validade do código conforme a análise realizada.
- **Scripts auxiliares:** Scripts em batch (`run.bat` e `cleanup.bat`) para facilitar a execução e limpeza dos arquivos temporários no ambiente Windows.

## Funcionalidades Principais

- **`calc.flex`:** Definição formal do analisador léxico (scanner) utilizando JFlex. Contém expressões regulares para identificação de tokens (identificadores, literais, operadores, delimitadores, palavras-chave) e ações associadas para retorno dos símbolos léxicos ao parser.

- **`calc.cup`:** Especificação da gramática livre de contexto da linguagem alvo, em formato compatível com o CUP. Inclui regras de produção, precedência, associatividade e ações semânticas para construção da árvore sintática abstrata e verificação sintática.

- **`scanner.java` / `scanner.class`:** Código fonte e bytecode Java gerados automaticamente pelo JFlex a partir de `calc.flex`. Implementa o método de leitura sequencial do fluxo de entrada, identificando e retornando tokens conforme a especificação léxica.

- **`parser.java` / `parser.class`:** Código fonte e bytecode Java gerados automaticamente pelo CUP a partir de `calc.cup`. Implementa o parser ascendente (LALR) que consome tokens do scanner e aplica a análise sintática com base na gramática definida, sinalizando erros de sintaxe.

- **`sym.java` / `sym.class`:** Classe contendo constantes inteiras que representam os códigos dos tokens léxicos, usada para comunicação entre scanner e parser.

- **`Main.java`:** Ponto de entrada da aplicação que instancia o scanner com o arquivo de entrada, executa o parser, e gerencia o fluxo de análise, incluindo tratamento e exibição de erros sintáticos.

- **`input.txt`:** Arquivo contendo o código-fonte a ser analisado pelo compilador, usado para testes funcionais do frontend.

- **`run.bat`:** Script de automação para compilar os arquivos Java e executar o compilador no ambiente Windows.

- **`cleanup.bat`:** Script para remoção de arquivos gerados durante o processo de compilação e execução, mantendo o ambiente limpo.


## Cenários de Teste e Arquivo de Entrada

- **Arquivo de entrada:** `input.txt` — contém código-fonte de exemplo para análise.
- **Exemplo de entrada no `input.txt`:**
  ```plaintext
  a = 5 + 3;
  b = a * 2;
  ```
- **Observação:**
  - O projeto não possui testes automatizados, então a validação é feita via execução manual utilizando o script `run.bat`.


## Configuração do Ambiente e Execução

Para rodar o projeto no Visual Studio Code, siga os passos abaixo:

1. **Pré-requisitos:**
   - Instale o [Java JDK 8 ou superior](https://www.oracle.com/java/technologies/javase-downloads.html).
   - Instale o [Visual Studio Code](https://code.visualstudio.com/).
   - Instale a extensão "Java Extension Pack" no VS Code para suporte ao Java.
   - Baixe as ferramentas [JFlex](https://jflex.de/) e [CUP](http://www2.cs.tum.edu/projects/cup/).

2. **Configuração do projeto:**
   - Clone o repositório para sua máquina.
   - Gere o analisador léxico com o JFlex:
     ```bash
     jflex calc.flex
     ```
   - Gere o analisador sintático com o CUP:
     ```bash
     java -jar java-cup-11b.jar calc.cup
     ```
   - Compile os arquivos `.java` gerados junto com o restante do código-fonte:
     ```bash
     javac *.java
     ```

3. **Executando o compilador:**
   - Crie ou edite o arquivo `input.txt` com o código-fonte a ser analisado.
   - Execute a classe principal:
     ```bash
     java Main
     ```
   - Observe as mensagens de erro ou sucesso da análise no terminal.

4. **Scripts auxiliares (para Windows):**
   - Use `run.bat` para compilar e executar automaticamente.
   - Use `cleanup.bat` para remover arquivos temporários gerados durante a compilação.

## Tecnologias e Ferramentas Utilizadas

- **Java:** Linguagem principal do projeto para a implementação do compilador.
- **JFlex:** Ferramenta para geração do analisador léxico (scanner).
- **CUP (Constructor of Useful Parsers):** Ferramenta para geração do analisador sintático (parser).
- **Batch scripts (.bat):** Para automatizar compilação e execução no Windows.

## Equipe de Desenvolvimento

- João Magalhães (usuário GitHub: [Joaomagh](https://github.com/Joaomagh)) — Autor e principal responsável pelo desenvolvimento do projeto.
- Guilherme Araújo (usuário GitHub: [GuilhermeAraujo63](https://github.com/GuilhermeAraujo63)) — Colaborador no desenvolvimento e melhorias do projeto.

import java_cup.runtime.Symbol;

%%

// --- Diretivas e Declarações ---

%class scanner
%cup
%line
%column
%unicode

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline + 1, yycolumn + 1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline + 1, yycolumn + 1, value);
  }
%}

// --- Definição de Estados Léxicos ---
%state COMMENT

// --- Definições de Expressões Regulares (Macros) ---
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
Identifier     = [a-zA-Z_][a-zA-Z_0-9]*
DIGIT          = [0-9]+

%%

// --- Regras Léxicas ---
<YYINITIAL> {

  /* Comentários */
  "/*"                { yybegin(COMMENT); }
  "//" [^\r\n]* {LineTerminator}? { /* Ignora comentário de linha única */ }

  /* Operadores Aritméticos e Relacionais */
  "+"                 { return symbol(sym.PLUS); }
  "-"                 { return symbol(sym.MINUS); }
  "*"                 { return symbol(sym.TIMES); }
  "/"                 { return symbol(sym.DIVIDE); }
  "=="                { return symbol(sym.EQ); }
  "!="                { return symbol(sym.NEQ); }
  ">"                 { return symbol(sym.GT); }
  "<"                 { return symbol(sym.LT); }


  /* Delimitadores e Atribuição */
  "="                 { return symbol(sym.ASSIGN); } // REGRA ADICIONADA
  ";"                 { return symbol(sym.SEMI); }
  "{"                 { return symbol(sym.LBRACE); }
  "}"                 { return symbol(sym.RBRACE); }
  "("                 { return symbol(sym.LPAREN); }
  ")"                 { return symbol(sym.RPAREN); }

  /* Keywords (Palavras-chave) */
  "if"                { return symbol(sym.IF); }

  /* Identificadores */
  {Identifier}        { return symbol(sym.ID, yytext()); }

  /* Números (mantido como Integer) */
  {DIGIT}             { return new Symbol(sym.NUMBER, Integer.parseInt(yytext())); }

  /* Ignorar espaços em branco */
  {WhiteSpace}        { /* Não faz nada */ }
}

<COMMENT> {
  "*/"                { yybegin(YYINITIAL); }
  [^*]                { /* Ignora qualquer caractere que não seja '*' */ }
  "*"                 { /* Ignora o '*' solitário */ }
}

/* Tratamento de Erros */
[^]                   { System.err.println("Erro Lexico: Caractere invalido <" + yytext() + "> na linha " + (yyline + 1)); }

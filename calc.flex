import java_cup.runtime.Symbol;

%%

%class scanner
%unicode
%cup

/* Expressões Regulares (seu estilo) */
WHITESPACE = [ \t\n\r]+
DIGIT      = [0-9]+

%%

/* Regras Léxicas */
<YYINITIAL> {
  {WHITESPACE}      { /* Ignora espaços em branco */ }
  ";"               { return new Symbol(sym.SEMI); }
  "+"               { return new Symbol(sym.PLUS); }
  "-"               { return new Symbol(sym.MINUS); }
  "*"               { return new Symbol(sym.TIMES); }
  "("               { return new Symbol(sym.LPAREN); }
  ")"               { return new Symbol(sym.RPAREN); }
  
  /* NOVOS OPERADORES ADICIONADOS AQUI */
  ">"               { return new Symbol(sym.GT); }
  "<"               { return new Symbol(sym.LT); }
  
  {DIGIT}           { return new Symbol(sym.NUMBER, Integer.parseInt(yytext())); }
  
  /* Tratamento de erro */
  .                 { System.err.println("Caractere ilegal: " + yytext()); }
}

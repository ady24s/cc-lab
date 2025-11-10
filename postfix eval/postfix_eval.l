%{
#include "postfix_eval.tab.h"   // Include YACC-generated token definitions
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }   // Numbers
[ \t\n]+    ;                                         // Ignore spaces, tabs, newlines
[+\-*/]     { return yytext[0]; }                     // Operators
.           ;                                         // Ignore any other character

%%

int yywrap() { return 1; }

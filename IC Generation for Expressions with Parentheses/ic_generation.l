%{
#include "ic_generation.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+                   { yylval.str = strdup(yytext); return NUM; }
"("                      { return '('; }
")"                      { return ')'; }
"*"                      { return '*'; }
"/"                      { return '/'; }
"+"                      { return '+'; }
"-"                      { return '-'; }
\n                       { return '\n'; }
[ \t\r]+                 ;
.                        { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() { return 1; }

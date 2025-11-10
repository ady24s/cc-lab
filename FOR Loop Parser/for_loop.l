%{
#include "for_loop.tab.h"
%}

%%

"for"            { return FOR; }
"++"             { return INC; }
"--"             { return DEC; }
"<"|"=="|"<="|">"|">=" { return RELOP; }
"="              { return '='; }
"+"              { return '+'; }
"-"              { return '-'; }
"*"              { return '*'; }
"/"              { return '/'; }
"("              { return '('; }
")"              { return ')'; }
"{"              { return '{'; }
"}"              { return '}'; }
";"              { return ';'; }
[0-9]+           { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+         ;   // skip whitespace
.                { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }

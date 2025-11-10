%{
#include "desk_calc_parenthesis.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+(\.[0-9]+)?    { yylval.val = atof(yytext); return NUMBER; }
[+\-*/()\n]          { return yytext[0]; }
[ \t]                ;   /* ignore spaces */
.                    { printf("Invalid character: %s\n", yytext); return 0; }

%%

int yywrap() { return 1; }

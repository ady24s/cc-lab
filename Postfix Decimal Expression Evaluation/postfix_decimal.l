%{
#include "postfix_decimal.tab.h"  // Include YACC token definitions
#include <stdlib.h>
%}

%%
[0-9]+(\.[0-9]+)?    { yylval = atof(yytext); return NUMBER; } // Decimal numbers
[ \t]+               ;  // Ignore spaces and tabs
\n                   { return 0; }  // End of input
[+\-*/]              { return yytext[0]; } // Operators
.                    ;  // Ignore any other character
%%

/* ---------- User Code ---------- */
int yywrap() { return 1; }

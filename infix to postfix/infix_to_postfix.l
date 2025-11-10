%{
#include "infix_to_postfix.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[0-9]+|[a-zA-Z]+   {
                      yylval.str = strdup(yytext);  // Copy number/variable
                      return ID;                     // Send to YACC
                   }
[ \t]+             ;   // Ignore spaces and tabs
\n                 { return 0; }  // End of input
.                  { return yytext[0]; }  // Return operator or parenthesis
%%

int yywrap() { return 1; }

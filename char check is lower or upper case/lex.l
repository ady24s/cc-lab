%{
#include <stdio.h>
%}

upper  [A-Z]
lower  [a-z]
other  [^a-zA-Z \t\n]

%%
{upper}  { printf("'%c' is an UPPERCASE character.\n", yytext[0]); }
{lower}  { printf("'%c' is a LOWERCASE character.\n", yytext[0]); }
{other}  { printf("'%c' is a NON-ALPHABETIC character.\n", yytext[0]); }
[ \t\n]+ ;   /* Ignore spaces, tabs, and newlines */
%%


int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }

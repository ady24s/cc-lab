%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+    {
              int num = atoi(yytext);     // Convert text to integer
              printf("Hex of %s = %X\n", yytext, num);
          }

[ \t\n]+   ;     // Ignore spaces, tabs, newlines
.           ;     // Ignore other characters

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}

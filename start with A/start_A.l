%{
#include <stdio.h>
int count = 0;
%}

alpha  [a-zA-Z]
digit  [0-9]
space  [ \t\n]

%%
^A                      { count++; }
{space}A({alpha}|{digit})*  { count++; }
.|\n                   
%%

int main() {
    yylex();
    printf("Count = %d\n", count);
    return 0;
}

int yywrap() { return 1; }

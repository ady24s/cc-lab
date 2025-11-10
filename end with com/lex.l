%{
#include <stdio.h>
int count = 0;
%}

%%
.*com\n      { count++; }     // Lines ending with "com"
.*\n         ;                // Ignore all other lines
%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Number of lines ending with 'com': %d\n", count);
    return 0;
}

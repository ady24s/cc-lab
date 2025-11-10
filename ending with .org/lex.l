%{
#include <stdio.h>
int count = 0;
%}

%%
.*\.org([^a-zA-Z0-9].*)?$   { count++; }   // Matches .org URLs
.|\n                          ;           // Ignore everything else
%%

int yywrap() { return 1; }

int main(void) {
    yylex();
    printf("Number of .org URLs: %d\n", count);
    return 0;
}

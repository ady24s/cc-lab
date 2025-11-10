%{
#include <stdio.h>
int count = 0;   // Counter for .edu URLs
%}

%%
.*\.edu([^a-zA-Z0-9].*)?$    { count++; }  // Matches .edu URLs
.|\n                          ;           // Ignore everything else
%%

int yywrap(void) {
    return 1;   // End of input
}

int main(void) {
    yylex();   // Start lexical analysis
    printf("Number of .edu URLs: %d\n", count);
    return 0;
}

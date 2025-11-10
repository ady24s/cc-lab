%{
#include <stdio.h>
#include <stdlib.h>
%}


%%
[0-9A-Fa-f]+ {
    // Convert the matched hexadecimal string to decimal
    int decimal = (int)strtol(yytext, NULL, 16);
    printf("Hexadecimal: %s  -->  Decimal: %d\n", yytext, decimal);
}

[ \t\n]+    ;     // Ignore spaces, tabs, and newlines
.           ;     // Ignore any other characters
%%


int yywrap() {
    return 1;     // End of input
}

int main() {
    printf("Hexadecimal to Decimal Conversion:\n");
    printf("----------------------------------\n");
    yylex();      // Start lexical analysis
    return 0;
}

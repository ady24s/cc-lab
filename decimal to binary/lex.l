%{
#include <stdio.h>
#include <stdlib.h>

int toBinary(int n) {
    if (n == 0) {
        printf("0\n");
        return 0;
    }
    int bin[32], i = 0;
    while (n > 0) {
        bin[i++] = n % 2;    // store remainder
        n = n / 2;           // divide by 2
    }
    for (int j = i - 1; j >= 0; j--)
        printf("%d", bin[j]);   // print in reverse order
    printf("\n");
    return 0;
}
%}

%%

[0-9]+     { 
              int num = atoi(yytext); 
              toBinary(num); 
           }

[ \t\n]+   ;   // ignore spaces, tabs, newlines
.          ;   // ignore any other characters

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}

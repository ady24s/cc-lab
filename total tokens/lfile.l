%{
#include <stdio.h>
int tokenCount = 0;
%}

KEYWORD     int|float|char|return|if|else|while|for|void
ID          [a-zA-Z_][a-zA-Z0-9_]*
NUMBER      [0-9]+
OPERATOR    [+\-*/=<>]
SYMBOL      [;:{}()[\],]

%%

{KEYWORD}   { tokenCount++; }
{ID}        { tokenCount++; }
{NUMBER}    { tokenCount++; }
{OPERATOR}  { tokenCount++; }
{SYMBOL}    { tokenCount++; }
[ \t\n]+    { /* ignore spaces, tabs, and newlines */ }
.           { tokenCount++; }

%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Total tokens: %d\n", tokenCount);
    return 0;
}

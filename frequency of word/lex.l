%{
#include <stdio.h>
#include <string.h>

int count = 0;
char targetWord[50] = "the";   // word to search for
%}

WORD    [a-zA-Z]+

%%

{WORD} {
    if (strcmp(yytext, targetWord) == 0)
        count++;
}

[ \t\n]+    { }       // ignore spaces, tabs, newlines
.           { }       // ignore other characters

%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Frequency of \"%s\": %d\n", targetWord, count);
    return 0;
}

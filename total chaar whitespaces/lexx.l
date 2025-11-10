%{
#include <stdio.h>

int charCount = 0;
int spaceCount = 0;
int tabCount = 0;
%}

%%

" "     { charCount++; spaceCount++; }   // for spaces
"\t"    { charCount++; tabCount++; }     // for tabs
.       { charCount++; }                 // any other character

%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Total characters : %d\n", charCount);
    printf("Total spaces     : %d\n", spaceCount);
    printf("Total tabs       : %d\n", tabCount);
    return 0;
}

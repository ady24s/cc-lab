%{
#include <stdio.h>

int lower_count = 0;
int upper_count = 0;
%}

lower [a-z]
upper [A-Z]

%%
{lower}  { lower_count++; }
{upper}  { upper_count++; }
.|\n     ;   /* Ignore everything else */
%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Total lowercase characters: %d\n", lower_count);
    printf("Total uppercase characters: %d\n", upper_count);
    return 0;
}

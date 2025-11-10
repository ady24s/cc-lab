%{
#include <stdio.h>
%}

vowel [aAeEiIoOuU]

%%
{vowel} {
    if (yytext[0] >= 'a' && yytext[0] <= 'z')
        printf("%c", yytext[0] - 32);   /* lowercase → uppercase */
    else
        printf("%c", yytext[0] + 32);   /* uppercase → lowercase */
}
.|\n  { printf("%s", yytext); }  /* print all other characters as-is */
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}

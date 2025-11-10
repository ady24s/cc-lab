%{
#include <stdio.h>
%}

lower  [a-z]
upper  [A-Z]
other  [^a-zA-Z]

%%
{lower}   { printf("%c", yytext[0] - 32); }   /* convert to uppercase */
{upper}   { printf("%c", yytext[0] + 32); }   /* convert to lowercase */
{other}+  { printf("%s", yytext); }           /* print non-letters same */
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}

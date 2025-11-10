%{
#include "function_check.tab.h"
%}

%%

"int"           { return TYPE; }
"float"         { return TYPE; }
"char"          { return TYPE; }
"void"          { return TYPE; }
"return"        { return RETURN; }
"="             { return '='; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }
","             { return ','; }
";"             { return ';'; }
"+"             { return '+'; }
"-"             { return '-'; }
[0-9]+          { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t\n]+        ;
.               { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }

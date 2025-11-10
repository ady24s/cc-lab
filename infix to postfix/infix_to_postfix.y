%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token <str> ID   // Token for numbers or variables

%%
expr: expr '+' term   { printf("+ "); }
    | expr '-' term   { printf("- "); }
    | term
    ;

term: term '*' factor { printf("* "); }
    | term '/' factor { printf("/ "); }
    | factor
    ;

factor: '(' expr ')'  { /* parentheses handled */ }
      | ID            { printf("%s ", $1); free($1); }
      ;
%%

int main() {
    printf("Enter Infix Expression:\n");
    yyparse();
    printf("\n");
    fflush(stdout);
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

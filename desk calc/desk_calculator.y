%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    double val;
}

%token <val> NUMBER
%type  <val> expr term factor

%%

calclist:
      /* empty */
    | calclist expr '\n'   { printf("Result = %.2f\n", $2); }
    | calclist error '\n'  { printf("Syntax Error! Please try again.\n"); yyerrok; }
    ;

expr:
      expr '+' term   { $$ = $1 + $3; }
    | expr '-' term   { $$ = $1 - $3; }
    | term
    ;

term:
      term '*' factor { $$ = $1 * $3; }
    | term '/' factor { 
                        if ($3 == 0)
                            printf("Error: Division by zero!\n");
                        else
                            $$ = $1 / $3;
                      }
    | factor
    ;

factor:
      '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;

%%

int main() {
    printf("Simple Desk Calculator (Ctrl+Z to exit)\nEnter expressions:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

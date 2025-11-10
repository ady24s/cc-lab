%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token TYPE ID NUM RETURN

%%

S : TYPE ID '(' PARAMS ')' '{' STMTS '}'
    {
        printf("Valid FUNCTION syntax.\n");
    }
  ;

PARAMS : PARAM_LIST
       | /* empty */ 
       ;

PARAM_LIST : PARAM_LIST ',' PARAM
           | PARAM
           ;

PARAM : TYPE ID ;

STMTS : STMTS STMT
      | STMT
      ;

STMT : RETURN EXPR ';'
     | ID '=' EXPR ';'
     ;

EXPR : ID
     | NUM
     | ID '+' ID
     | ID '+' NUM
     | NUM '+' ID
     | ID '-' ID
     | ID '-' NUM
     | NUM '-' ID
     ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter a function definition:\n");
    yyparse();
    return 0;
}

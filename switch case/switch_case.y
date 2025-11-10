%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token SWITCH CASE DEFAULT BREAK COLON ID NUM

%%

S : SWITCH '(' ID ')' '{' CASES '}'
    {
        printf("Valid SWITCH statement syntax.\n");
    }
  ;

CASES : CASES CASE_BLOCK
      | CASE_BLOCK
      ;

CASE_BLOCK : CASE NUM COLON STMTS
           | CASE NUM COLON STMTS BREAK ';'
           | DEFAULT COLON STMTS
           ;

STMTS : STMTS STMT
      | STMT
      ;

STMT : ID '=' EXPR ';'
     | ID '=' ID ';'
     | ID '=' NUM ';'
     | ID '=' ID '+' ID ';'
     | ID '=' ID '+' NUM ';'
     | ID '=' NUM '+' ID ';'
     ;

EXPR : EXPR '+' EXPR
     | EXPR '-' EXPR
     | EXPR '*' EXPR
     | EXPR '/' EXPR
     | ID
     | NUM
     ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter a SWITCH statement:\n");
    yyparse();
    return 0;
}

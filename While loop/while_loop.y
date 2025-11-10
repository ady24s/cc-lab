%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token WHILE ID NUM RELOP INC DEC

%%

S : WHILE '(' CONDITION ')' STMT
    {
        printf("Valid WHILE loop syntax.\n");
    }
  ;

CONDITION : ID RELOP NUM
          | ID RELOP ID
          ;

STMT : '{' STMT_LIST '}'
     | SINGLE_STMT
     ;

STMT_LIST : STMT_LIST SINGLE_STMT
          | SINGLE_STMT
          ;

SINGLE_STMT : ID '=' EXPR ';'
            | ID INC ';'
            | ID DEC ';'
            | S   /* allow nested while loops */
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
    printf("Enter a WHILE loop:\n");
    yyparse();
    return 0;
}

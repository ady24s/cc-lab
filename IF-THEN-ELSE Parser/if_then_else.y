%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token IF ELSE ID NUM RELOP

%%

S : IF '(' CONDITION ')' STMT
    {
        printf("Valid IF-THEN statement syntax.\n");
    }
  | IF '(' CONDITION ')' STMT ELSE STMT
    {
        printf("Valid IF-THEN-ELSE statement syntax.\n");
    }
  ;

CONDITION : ID RELOP ID
           | ID RELOP NUM
           | NUM RELOP ID
           ;

STMT : ID '=' EXPR ';'
     | ID ';'
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
    printf("Enter an IF-THEN-ELSE statement:\n");
    yyparse();
    return 0;
}

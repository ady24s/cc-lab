%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP INC DEC

%%

S : FOR '(' E1 ';' E2 ';' E3 ')' STMT
    {
        printf("Valid FOR loop syntax.\n");
    }
  ;

E1 : ID '=' NUM
    | ID '=' ID
    ;

E2 : ID RELOP NUM
    | ID RELOP ID
    ;

E3 : ID INC
    | ID DEC
    | INC ID
    | DEC ID
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
    printf("Enter a FOR loop:\n");
    yyparse();
    return 0;
}

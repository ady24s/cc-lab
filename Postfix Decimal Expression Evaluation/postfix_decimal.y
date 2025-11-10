%{
#include <stdio.h>
#include <stdlib.h>

float stack[100];
int top = -1;

void push(float n) { stack[++top] = n; }
float pop() { return stack[top--]; }

int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }
%}

%token NUMBER   // Decimal numbers

%%

expr:
      expr NUMBER        { push($2); }                   // Push numbers onto stack
    | expr '+'           { float b=pop(), a=pop(); push(a+b); }
    | expr '-'           { float b=pop(), a=pop(); push(a-b); }
    | expr '*'           { float b=pop(), a=pop(); push(a*b); }
    | expr '/'           { float b=pop(), a=pop(); push(a/b); }
    | /* empty */                                  // Allow empty
    ;
%%

int main() {
    printf("Enter Postfix Expression with decimal numbers:\n");
    yyparse();
    printf("Result = %.2f\n", pop());
    return 0;
}

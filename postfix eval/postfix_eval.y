%{
#include <stdio.h>
#include <stdlib.h>

int stack[100], top = -1;

// Push and pop functions for evaluation
void push(int n) { stack[++top] = n; }
int pop() { return stack[top--]; }

int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }
%}

%token NUMBER   // Define NUMBER token

%%

expr:
      expr NUMBER           { push($2); }          // Push number to stack
    | expr '+'              { int b=pop(), a=pop(); push(a+b); }
    | expr '-'              { int b=pop(), a=pop(); push(a-b); }
    | expr '*'              { int b=pop(), a=pop(); push(a*b); }
    | expr '/'              { int b=pop(), a=pop(); push(a/b); }
    | /* empty */                                  // Allow empty expression
    ;

%%

int main() {
    printf("Enter Postfix Expression:\n");
    yyparse();
    printf("Result = %d\n", pop());
    return 0;
}

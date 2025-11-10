%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

int tempCount = 1;
void newTemp(char *buf) {
    sprintf(buf, "t%d", tempCount++);
}
%}

%union {
    char *str;
}

%token <str> ID NUM
%type  <str> E

%left '+' '-'
%left '*' '/'
%left '(' ')'

%%

S : E '\n' { printf("\nIntermediate Code Generated Successfully.\n"); }
  ;

E : E '+' E
    {
        char temp[10];
        newTemp(temp);
        printf("%s = %s + %s\n", temp, $1, $3);
        $$ = strdup(temp);
    }
  | E '-' E
    {
        char temp[10];
        newTemp(temp);
        printf("%s = %s - %s\n", temp, $1, $3);
        $$ = strdup(temp);
    }
  | E '*' E
    {
        char temp[10];
        newTemp(temp);
        printf("%s = %s * %s\n", temp, $1, $3);
        $$ = strdup(temp);
    }
  | E '/' E
    {
        char temp[10];
        newTemp(temp);
        printf("%s = %s / %s\n", temp, $1, $3);
        $$ = strdup(temp);
    }
  | '(' E ')' { $$ = $2; }
  | ID        { $$ = strdup($1); }
  | NUM       { $$ = strdup($1); }
  ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}

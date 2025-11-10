%{
#include<stdio.h>
int count = 0;
%}

%%
\n {count ++;}
. {}
%%

int main(){
 yylex();
 printf("total lines: %d\n", count);
 return 0;
}

int yywrap() {return 1;}
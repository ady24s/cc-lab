%{ 
#include <stdio.h> 
int count = 0; 
%} 
 
alpha   [a-zA-Z] 
digit   [0-9] 
space   [ \t\n] 
 
%% 
 
a({alpha}|{digit})*a     { count++; } 
 
{space}+                 {}
 
.|\n                     {}
 
%% 
 
 
int main() { 
    yylex(); 
    printf("count= %d\n", count); 
    return 0; 
} 
int yywrap() { return 1; } 

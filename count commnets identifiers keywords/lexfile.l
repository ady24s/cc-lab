
%{ 
#include <stdio.h> 
#include <string.h> 
 
int commentCount = 0; 
int keywordCount = 0; 
int identifierCount = 0; 
int wordCount = 0; 
int lineCount = 0; 
int spaceCount = 0; 
 
// List of keywords 
char *keywords[] = { 
    "int", "float", "char", "if", "else", "while", "for", "return", "void" 
}; 
 
int isKeyword(char *str) { 
    int i; 
    for (i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) { 
        if (strcmp(str, keywords[i]) == 0) 
            return 1; 
    } 
    return 0; 
} 
%} 
 
ID      [a-zA-Z_][a-zA-Z0-9_]* 
SPACE   [ \t]+ 
NEWLINE \n 
 
%% 
 
"//".*                       { commentCount++; lineCount++; } 
"/*"([^*]|\*+[^*/])*\*+"/"   { commentCount++; } 
 
{ID} { 
    wordCount++; 
    if (isKeyword(yytext)) 
        keywordCount++; 
    else 
        identifierCount++; 
} 
 
{SPACE}     { spaceCount += yyleng; } 
{NEWLINE}   { lineCount++; } 
 
.           { } 
 
%% 
 
int yywrap() { 
    return 1; 
} 
 
int main() { 
    yylex(); 
 
    lineCount++; 
 
    printf("Comments    : %d\n", commentCount); 
    printf("Keywords    : %d\n", keywordCount); 
    printf("Identifiers : %d\n", identifierCount); 
    printf("Words       : %d\n", wordCount); 
    printf("Lines       : %d\n", lineCount); 
    printf("Spaces      : %d\n", spaceCount); 
 
    return 0; 
} 
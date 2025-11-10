%{
#include <stdio.h>

FILE *fp;   // Output file pointer
%}

%%

[a-z]   { fputc(yytext[0] - 32, fp); }     // Lowercase → Uppercase
[A-Z]   { fputc(yytext[0] + 32, fp); }     // Uppercase → Lowercase
.|\n    { fputc(yytext[0], fp); }          // Copy all other characters as-is

%%

int yywrap(void) {
    return 1;
}

int main() {
    fp = fopen("output.txt", "w");   // Open output file for writing
    if (!fp) {
        printf("Error opening output file.\n");
        return 1;
    }

    yylex();                         // Run the lexer (read from input file)
    fclose(fp);                      // Close output file

    printf("Case conversion completed. Check 'output.txt'.\n");
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror();

%}

%token NUMBER
%token VARIABLE
%token ADD SUBTRACT MULTIPLY DIVIDE ASSIGN
%token AND OR ISEQUAL NOTEQUAL
%token CHECK DO
%token OPENP CLOSEP OPENBLOCK CLOSEBLOCK ENDLINE FINISH

%left '+' '-'
%left '*' '/'
%left ISEQUAL NOTEQUAL
%left AND OR

%start program

%%

program: statements FINISH
       | FINISH
       |
       ;

statements: statement
          | statements statement
          ;

statement: OP
         | CHECK LOGIC OPENBLOCK statements CLOSEBLOCK
         | DO OPENP E CLOSEP OPENBLOCK statements CLOSEBLOCK
         ;

OP: VARIABLE ASSIGN E ENDLINE
  ;

LOGIC: LOGIC AND LOGIC
     | LOGIC OR LOGIC 
     | E ISEQUAL T
     | E NOTEQUAL T
     | OPENP LOGIC CLOSEP
     ;

E: E ADD T
 | E SUBTRACT T
 | T
 ;

T: T MULTIPLY F
 | T DIVIDE F
 | F
 ;

F: OPENP E CLOSEP
 | SUBTRACT F
 | NUMBER
 | VARIABLE
 ;

%%

void yyerror() {
    printf("syntax error\n");
    exit(1);
}

int main() {
    yyparse();
    printf("OK\n");
    return 0;
}

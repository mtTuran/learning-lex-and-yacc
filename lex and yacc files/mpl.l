%{
#include <stdio.h>
#include <stdlib.h>
#include "mpl.tab.h"
%}
%option noyywrap
%%
"("                     {return OPENP;}
")"                     {return CLOSEP;}
"{"                     {return OPENBLOCK;}
"}"                     {return CLOSEBLOCK;}
"$"                     {return ENDLINE;}
"="                     {return ASSIGN;}
"+"                     {return ADD;}
"-"                     {return SUBTRACT;}
"*"                     {return MULTIPLY;}
"/"                     {return DIVIDE;}
"and"                   {return AND;}
"or"                    {return OR;}
"=="                    {return ISEQUAL;}
"!="                    {return NOTEQUAL;}
"check"                 {return CHECK;}
"do"                    {return DO;}
"FINISH"                {return FINISH;}
[a-zA-Z_][a-zA-Z0-9_]*  {return VARIABLE;}
[0-9]+                  {return NUMBER;}
[ \t\n]                 ;
.                       {printf("syntax error\n"); exit(1);}

%%

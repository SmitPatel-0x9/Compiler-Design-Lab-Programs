%{
#include "y.tab.h"
%}
%%
"int"|"float"|"void"|"char"	{return TYPE;}
"return"	{return RET;}
[_a-zA-Z][_a-zA-Z0-9]*	{return IDEN;}
[0-9]+	{return NUM;}
[ \t\n]	;
.	{return yytext[0];}
%%

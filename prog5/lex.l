%{
#include "y.tab.h"
%}
%%
"int"|"float"|"char"	{return TYPE;}
[_a-zA-Z][_a-zA-Z0-9]*	{return IDEN;}
[0-9]+	{return NUM;}
[\n]	{return 0;}
.	{return yytext[0];}
%%


%{
#include "y.tab.h"
%}
%%
"if"	{return IF;}
[_a-zA-Z][_a-zA-Z0-9]*	{return IDEN;}
[0-9]+	{return NUM;}
.	{return yytext[0];}
[\n] {return 0;}
%%

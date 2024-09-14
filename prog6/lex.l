%{
#include "y.tab.h"
#include "string.h"
%}
%%
[_a-zA-Z][_a-zA-Z0-9]*	{yylval.exp=strdup(yytext);return IDEN;}
[0-9]+	{yylval.exp=strdup(yytext);return NUM;}
[\n] {return '\n';}
. {return yytext[0];}
%%

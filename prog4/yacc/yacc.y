%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}
%token NUM IDEN IF
%left '+' '-'
%left '*' '/'
%%
S:I
I:IF'('EXP')'B	{count++;}
;
B:'{'STMT'}' ;
STMT:S1';'STMT | I STMT | ;
EXP:IDEN Z IDEN|IDEN Z NUM;
Z:'='|'<''='|'=''='|'<'|'>'|'>''=';
E:E'+'E|E'-'E|E'*'E|E'/'E|'+''+'E|E'+''+'|'-''-'E|E'-''-'|NUM|IDEN ;
S1:ASSGN|E ;
ASSGN:IDEN'='E ;
%%
int main()
{
yyparse();
printf("%d",count);
return 0;
}
int yyerror()
{
printf("Invalid");
exit(0);
}

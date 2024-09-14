%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}
%token NUM IDEN FOR
%left '+' '-'
%left '*' '/'
%%
S:I	{printf("The number of nested loops:%d",count);}
I:FOR'('E';'E';'E')'B {count++;}
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
|
;
Z:'='|'+'|'-'|'*'|'/'|'<'|'>'|'<''='|'>''=' ;
U:'+''+'|'-''-' ;
B:'{'STMT'}' ;
STMT:S1';'STMT | I STMT | ;
EXP:EXP'+'EXP|EXP'-'EXP|EXP'*'EXP|EXP'/'EXP|'+''+'EXP|EXP'+''+'|'-''-'EXP|EXP'-''-'|NUM|IDEN ;
S1:ASSGN|EXP ;
ASSGN:IDEN'='EXP ;
%%
int main()
{
printf("Enter the loop statement\n");
yyparse();
printf("Valid\n");
return 0;
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}


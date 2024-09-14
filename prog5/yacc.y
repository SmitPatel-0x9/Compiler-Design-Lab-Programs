%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}
%token IDEN TYPE NUM
%%
S:I
;
I:TYPE' 'VAR';'
;
VAR:V	{count++;}
|VAR','V	{count++;}
;
V:IDEN
|IDEN'['NUM']'
;
%%
int main()
{
printf("Enter the statement\n");
yyparse();
printf("%d\n",count);
return 0;
}
int yyerror()
{
printf("Invalid\n");
return 1;
}

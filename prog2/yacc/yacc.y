%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S:I	{printf("The result of the equation is:%d\n",$$);}
I:I'+'I {$$=$1+$3;}
|I'-'I	{$$=$1-$3;}
|I'*'I	{$$=$1*$3;}
|I'/'I	{if($3==0){yyerror();} $$=$1/$3;}
|'('I')'{$$=$2;}
|NUM	{$$=$1;}
|'-'NUM	{$$=-$2;}
;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
printf("Success\n");
return 0;
}
int yyerror()
{
printf("Invalid");
exit(0);
}

%{
#include<stdio.h>
int iden=0,op=0,keywords=0;
%}
%%
"int"|"float"|"char"|"void"|"break"|"return"|"while"|"for"	{keywords++;}
[\+\-\*\/\!\=\%\^\&\|]	{op++;}
[_a-zA-Z][_a-zA-Z0-9]*	{iden++;}
"#include".* ;
"#"[a-zA-Z]+.* ;
[;] ;
[ ] ;
[\n] ;
[,] ;
%%
int main()
{
yyin=fopen("in.c","r");
yylex();
printf("keywords:%d\toperators:%d\tidentifiers:%d\n",keywords,op,iden);
return 0;
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}

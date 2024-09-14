%{
#include<stdio.h>
#include<stdlib.h>
typedef char* string;
struct{
string res,op1,op2;
char op;
}code[100];
int idx=-1;
string addToTable(string op1,string op2,char op);
void TAC();
void quad();
%}
%union{
char* exp;
}
%token <exp> IDEN NUM
%type <exp> EXP
%left '+' '-'
%left '*' '/'
%%
STMTS:STMTS ST
| ;
ST:EXP '\n' ;
EXP:EXP'+'EXP	{$$=addToTable($1,$3,'+');}
|EXP'-'EXP	{$$=addToTable($1,$3,'-');}
|EXP'*'EXP	{$$=addToTable($1,$3,'*');}
|EXP'/'EXP	{$$=addToTable($1,$3,'/');}
|'('EXP')'	{$$=$2;}
|IDEN'='EXP	{$$=addToTable($1,$3,'=');}
|IDEN	{$$=$1;}
|NUM	{$$=$1;}
;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
printf("Tac is\n");
TAC();
printf("Quad is\n");
quad();
return 0;
}
int yyerror()
{
printf("Invalid\n");
return 1;
}
string addToTable(string op1,string op2,char op)
{
idx++;
if(op=='=')
{
code[idx].res=op1;
code[idx].op1=op2;
code[idx].op2=" ";
code[idx].op=' ';
return op1;
}
string res=malloc(3);
sprintf(res,"@%c",idx+'A');
code[idx].res=res;
code[idx].op1=op1;
code[idx].op2=op2;
code[idx].op=op;
return res;
}
void TAC()
{
for(int i=0;i<=idx;i++)
{
printf("%s=%s %c %s\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
}
}
void quad()
{
for(int i=0;i<=idx;i++)
{
if(code[i].op==' ')
{
printf("%d:= %s %s %s\n",i,code[i].op1,code[i].op2,code[i].res);
}
else
{
printf("%d:%c %s %s %s\n",i,code[i].op,code[i].op1,code[i].op2,code[i].res);
}
}
}

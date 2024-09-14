%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM IDEN TYPE RET
%left '+' '-'
%left '*' '/'
%%
S:FUN
;
FUN:TYPE IDEN'('PARAMS')'BODY
;
PARAMS:PARAMS','PARAM
|PARAM
|
;
PARAM:TYPE IDEN
;
BODY:'{'SS'}'
;
SS:S1';'SS
|RET E';'
|
;
S1:DECL
|ASSGN
|E
;
DECL:TYPE IDEN
|TYPE ASSGN
;
ASSGN:IDEN'='E
;
E:E'+'E
|E'-'E
|E'*'E
|E'/'E
|'('E')'
|T
;
T:IDEN
|NUM
;
%%
int main()
{
yyparse();
printf("Valid\n");
return 0;
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}

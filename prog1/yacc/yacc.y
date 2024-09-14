%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
S:A B
;
A:'a' A 'b'
|
;
B:'b' B 'c'
|
;
%%
int main()
{
printf("Enter string\n");
yyparse();
printf("valid\n");
return 0;
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}

%{
#include<stdio.h>
int lines=1,characters=0,words=0,spaces=0;
%}
%%
[\n]	{lines++;}
[\t]	{spaces+=4;}
[ ]	{spaces++;}
[^ \n\t#]+	{words++;characters+=yyleng;}
#	{return 0;}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter the paragraph\n");
yylex();
printf("No of lines:%d\t No of words:%d\t No of characters:%d\t No of spaces:%d\t",lines,words,characters,spaces);
return 0;
}

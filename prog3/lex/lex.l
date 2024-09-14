%{
#include<stdio.h>
int single=0,multi=0,mlines=1,nest=0;
%}
%%
"//"[^\n\/\*]* {if(nest==0){fprintf(yyout,"\n");} single++;}
"/*"[^\n\/\*]* {if(nest==0){fprintf(yyout,"\n");} multi++;nest++;}
"*/"	{nest--;}
[\n]	{if(nest>0){mlines++;} else{fprintf(yyout,"\n");}}
.	{if(nest==0){fprintf(yyout,"%s",yytext);}}
%%

int main()
{
yyin=fopen("in.txt","r");
yyout=fopen("out.txt","w");
yylex();
printf("Single:%d\t Multi:%d\t Mlines:%d\n",single,multi,mlines);
return 0;
}
int yywrap()
{
return 1;
}

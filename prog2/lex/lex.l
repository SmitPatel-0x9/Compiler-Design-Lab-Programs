%{
#include<stdio.h>
int posint=0,negint=0,posfrac=0,negfrac=0;
%}
num [0-9]+
posint \+?{num}
negint -{num}
posfrac \+?{num}*\.?{num}\/\+?{num}*\.?{num}|-{num}*\.?{num}\/-{num}*\.?{num}|\+?{num}*\.?{num}
negfrac \+?{num}*\.?{num}\/-{num}*\.?{num}|-{num}*\.?{num}\/\+?{num}*\.?{num}|-{num}*\.?{num}
%%
[\t ] ;
{posint} {posint++;}
{negint} {negint++;}
{posfrac} {posfrac++;}
{negfrac} {negfrac++;}
[\n] return 0;
%%
int main()
{
printf("Enter numbers\n");
yylex();
printf("PosInt:%d\t NegInt:%d PosFrac:%d\t NegFrac:%d\t",posint,negint,posfrac,negfrac);
return 0;
}
int yywrap()
{
return 1;
}


%{
	#include<stdlib.h>
	#include <string.h>
	#include "y.tab.h"
	#include<ctype.h>
	void yyerror(char const *str);
	int yylex();
	int i=0,j=0,x=0,y=0;
%}
%option yylineno
%option noyywrap
numbers ([0-9])+
a "%d"|"%f"|"%c"|"%s"
id [a-zA-Z][a-zA-Z0-9]*
blank [ \t\n]+

%%
int return INT;
double return DOUBLE;
char return CHAR;
float return FLOAT;
if 			return IF;
else		return ELSE;
for 		return FOR;
while 		return WHILE;
scanf 		return SCANF;
printf 		return PRINTF;
{a} 		return (CHA);
"," return COMA;
[a-zA-Z]+[a-zA-Z0-9]*		{sscanf(yytext, "%s",yylval.name); return (ID);}
{numbers}	{sscanf(yytext, "%s",yylval.name); return (NUMBER);}
"<=" 		return LE;
">=" 		return GE;
"==" 		return EQ;
"!=" 		return NE;
"||" 		return OR;
"&&" 		return AND;
"{"			{return (OPEN);}
"}"			{return (CLOSE);}
">"			{return (G);}
"<"			{return (L);}
"="			{return (E);}
"+" 		{return (PLUS);}
"-" 		{return (MINUS);}
"*" 		{return (TIMES);}
"/" 		{return (BY);}
";"			{return (SEMI);}
")"			{return (PL);}
"("			{return (PR);}
"&"			{return (ADRS);}
"\"" 		{return (AIR);}
{blank}		{;}
.			{printf("unexpected input %c",yytext[0]);}
%%
void yyerror(char const *str)
{
    fprintf(stderr,"Error Found!! in Line: %d\n%s\n",yylineno,str);
}


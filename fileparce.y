%{
	#include<stdio.h>
	#include<stdlib.h>
	#include <string.h>
	#include "y.tab.h"
	int yylex();
	int c = 0;
	char buffer[100];
%}

%token IF ELSE OPEN CLOSE PR PL PLUS MINUS SEMI NUMBER ID INT DOUBLE CHAR FLOAT COMA FOR G L WHILE LE GE EQ NE OR AND E TIMES BY ADRS AIR CHA SCANF PRINTF
%right E
%left OR AND
%left L G LE GE EQ NE
%left PLUS MINUS
%left TIMES BY
%right UMINUS
%start line
%type <name> NUMBER line ID INT DOUBLE CHAR FLOAT varlist BODY DEFOR DEWHILE DEIF expr condition stat forcond  list MANY OTH listF PER listFP MANYP OTHP PERP

%union{
	char name[200];
}

%%

line:		 {;}
		| line IF PR condition PL DEIF ELSE DEIF {strcpy($$,$1);strcat($$,"\n If "); strcat($$,$4); strcat($$," then\n "); strcat($$,$6); strcat($$," \nElse\n "); strcat($$,$8); printf("If %s then\n %s \nElse \n %s",$4,$6,$8);}
		| line IF PR condition PL DEIF {strcpy($$,$1);strcat($$,"\n If "); strcat($$,$4); strcat($$," then\n "); strcat($$,$6); printf("If %s then\n %s \n",$4,$6);}
		| line INT list {strcpy($$,$1); strcat($$,"\n Dim "); strcat($$,$3); strcat($$," As Integer\n"); printf("Dim %s As Integer\n",$3);}
		| line FLOAT list {strcpy($$,$1); strcat($$,"\n Dim "); strcat($$,$3); strcat($$," As Float\n");printf("Dim %s As Float\n",$3);}
		| line CHAR list {strcpy($$,$1); strcat($$,"\n Dim "); strcat($$,$3); strcat($$," As Char\n");printf("Dim %s As Char\n",$3);}
		| line DOUBLE list {strcpy($$,$1); strcat($$,"\n Dim "); strcat($$,$3); strcat($$," As Double\n");printf("Dim %s As Double\n",$3);}
		| line SCANF listF {strcpy($$,$1); strcat($$,$3); printf("%s\n",$3);}
		| line PRINTF listFP {strcpy($$,$1); strcat($$,"Consol.WriteLine "); strcat($$,$3); printf("Consol.WriteLine %s\n",$3);}
		| line FOR PR ID E NUMBER SEMI condition SEMI forcond PL DEFOR {strcpy($$,$1);strcat($$,"\n For "); strcat($$,$4); strcat($$," = "); strcat($$,$6); strcat($$," To "); strcat($$,$8); strcat($$," step "); strcat($$,$10); strcat($$,"\n "); strcat($$,$12); strcat($$,"\n");printf("For %s = %s To %s step %s\n %s",$4,$6,$8,$10,$12);}
		| line WHILE PR condition PL DEWHILE {strcpy($$,$1);strcat($$,"\n While "); strcat($$,$4); strcat($$,"\n "); strcat($$,$6);  strcat($$,"\n");printf("While %s\n %s",$4,$6);}
		;
DEIF	: OPEN BODY CLOSE {strcpy($$,""); strcat($$,$2); strcat($$,"EndIf");}
		| stat SEMI {strcpy($$,""); strcat($$,$1); strcat($$,"\nEndIf");}
		| line {strcpy($$,""); strcat($$,$1); strcat($$,"\nEndIf");}
		|	{;}
		;
DEFOR	: OPEN BODY CLOSE {strcpy($$,""); strcat($$,$2); strcat($$,"Next");}
		| stat SEMI {strcpy($$,""); strcat($$,$1); strcat($$,"\nNext");}
		| line {strcpy($$,""); strcat($$,$1); strcat($$,"\nNext");}
		|	{;}
		;
DEWHILE	: OPEN BODY CLOSE {strcpy($$,""); strcat($$,$2); strcat($$,"Wend");}
		| stat SEMI {strcpy($$,""); strcat($$,$1); strcat($$,"\nWend");}
		| line {strcpy($$,""); strcat($$,$1); strcat($$,"\nWend");}
		|	{;}
		;
listFP		: PR MANYP PL SEMI  {strcpy($$,"");strcat($$,"("); strcat($$,$2); strcat($$,")"); strcpy($2,"");}
			| 	{;}
			;
MANYP 		: AIR PERP AIR OTHP {strcpy($$,""); strcat($$,$2); strcat($$,$4);strcpy($4,""); strcpy($2,"");}
			;
OTHP 		: OTHP COMA ID {strcpy($$,$1); strcat($$," , "); strcat($$,$3); strcpy($3,"");c=0;}
			| {;}
			;
PERP 		: PERP CHA {strcpy($$,$1);strcat($$,"{");
 sprintf(buffer, "%d", c); strcat($$,buffer); strcat($$,"}"); strcpy($1,""); c++;}
			|PERP COMA CHA {strcpy($$,$1);strcat($$,"{") ;strcat($$,"}"); strcpy($1,"");}
			| PERP ID {strcpy($$,$1); strcat($$,$2); strcpy($2,"");strcpy($1,"");}
			| {;}
			; 
listF		: PR MANY PL SEMI  {strcpy($$,"");strcat($$,$2);}
			| 	{;}
			;
MANY 		: AIR PER AIR OTH {strcpy($$,$4); strcpy($4,"");}
			;
OTH 		: OTH COMA ADRS ID {strcpy($$,$1);strcat($$,$4); strcat($$," = Consol.ReadLine()");}
			| {;} 
			; 
PER 		: PER CHA {;}
			| COMA PER {;}
			| {;}
			;
list		: varlist SEMI  {strcpy($$,"");strcat($$,$1);}
			| 	{;}
			;
varlist 	: varlist COMA ID {strcpy($$,""); strcat($$,$1); strcat($$," , "); strcat($$,$3);}
			| ID {strcpy($$,"");strcat($$,$1);}
			;
BODY	: BODY stat SEMI {strcpy($$,$1); strcat($$,$2); strcat($$,"\n ");}
		| BODY line {strcpy($$,""); strcat($$,$2); strcat($$,"\n");}
		|	{strcpy($$,"");}
		;
condition: expr G expr {strcpy($$,"");strcat($$,$1);strcat($$," > ");strcat($$,$3);}
		|expr L expr {strcpy($$,"");strcat($$,$1);strcat($$," < ");strcat($$,$3);}
		|expr LE expr {strcpy($$,"");strcat($$,$1);strcat($$," <= ");strcat($$,$3);}
		|expr GE expr {strcpy($$,"");strcat($$,$1);strcat($$," >= ");strcat($$,$3);}
		|condition OR condition {strcpy($$,"");strcat($$,$1);strcat($$," OR ");strcat($$,$3);}
		|condition AND condition {strcpy($$,"");strcat($$,$1);strcat($$," AND ");strcat($$,$3);}
		|expr EQ expr {strcpy($$,"");strcat($$,$1);strcat($$," = ");strcat($$,$3);}
		|expr NE expr {strcpy($$,"");strcat($$,$1);strcat($$," <> ");strcat($$,$3);}
		|expr {strcpy($$,"");strcat($$,$1);}
		;	
forcond:	ID PLUS PLUS {strcpy($$,""); strcat($$,"1");}
			|ID MINUS MINUS {strcpy($$,""); strcat($$,"-"); strcat($$,"1");}
			|ID E NUMBER {strcpy($$,""); strcat($$,$3);}
			|ID E MINUS NUMBER {strcpy($$,""); strcat($$,"-"); strcat($$,$4);}
			;
stat: expr PLUS expr {strcpy($$,"");strcat($$,$1);strcat($$," + ");strcat($$,$3);}	
	|	expr MINUS expr {strcpy($$,"");strcat($$,$1);strcat($$," - ");strcat($$,$3);}
	|	expr TIMES expr {strcpy($$,"");strcat($$,$1);strcat($$," * ");strcat($$,$3);}
	|	expr BY expr {strcpy($$,"");strcat($$,$1);strcat($$," / ");strcat($$,$3);}
	|	expr PLUS PLUS {strcpy($$,"");strcat($$,$1);strcat($$," = ");strcat($$,$1); strcat($$," + "); strcat($$,"1");}
	|	expr MINUS MINUS {strcpy($$,"");strcat($$,$1);strcat($$," = ");strcat($$,$1); strcat($$," - "); strcat($$,"1");}
	|	ID E stat {strcpy($$,"");strcat($$,$1);strcat($$," = ");strcat($$,$3);}
	|expr {strcpy($$,"");strcat($$,$1);}
	;

expr: ID {strcpy($$,"");strcat($$,$1);}
	|NUMBER {strcpy($$,"");strcat($$,$1);}
	;
%%
int yywrap(){
	return 1;
}
int main(){
	 return yyparse();
}

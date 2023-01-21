/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IF = 258,
    ELSE = 259,
    OPEN = 260,
    CLOSE = 261,
    PR = 262,
    PL = 263,
    PLUS = 264,
    MINUS = 265,
    SEMI = 266,
    NUMBER = 267,
    ID = 268,
    INT = 269,
    DOUBLE = 270,
    CHAR = 271,
    FLOAT = 272,
    COMA = 273,
    FOR = 274,
    G = 275,
    L = 276,
    WHILE = 277,
    LE = 278,
    GE = 279,
    EQ = 280,
    NE = 281,
    OR = 282,
    AND = 283,
    E = 284,
    TIMES = 285,
    BY = 286,
    ADRS = 287,
    AIR = 288,
    CHA = 289,
    SCANF = 290,
    PRINTF = 291,
    UMINUS = 292
  };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define OPEN 260
#define CLOSE 261
#define PR 262
#define PL 263
#define PLUS 264
#define MINUS 265
#define SEMI 266
#define NUMBER 267
#define ID 268
#define INT 269
#define DOUBLE 270
#define CHAR 271
#define FLOAT 272
#define COMA 273
#define FOR 274
#define G 275
#define L 276
#define WHILE 277
#define LE 278
#define GE 279
#define EQ 280
#define NE 281
#define OR 282
#define AND 283
#define E 284
#define TIMES 285
#define BY 286
#define ADRS 287
#define AIR 288
#define CHA 289
#define SCANF 290
#define PRINTF 291
#define UMINUS 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "fileparce.y" /* yacc.c:1909  */

	char name[200];

#line 132 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.
 */
%{
#include "y.tab.h"

char string_buff_1[256]; /* to assemble string constants */
char string_buff_2[256]; /* to assemble string constants */
char string_bin[10]; /* to assemble string constants for segment display */

int seg_count = 0;
int ifID = 0; /* (when expecting multiple id's)if met with an identifier in a line then 1 else 0. */

 /* reset bin string buffer once the string is added */
void reset_bin_prop() {
  seg_count = 0;
  memset(string_bin, 0, 10);
}

 /* reset string buffer once the string is added */
void reset_str_prop() {
  memset(string_buff_1, 0, 256);
  memset(string_buff_2, 0, 256);
}

%}

/*
 * Define names for regular expressions here.
 */

INIT              [iI][nN][iI][tT]
SELECT            [sS][eE][lL][eE][cC][tT]":"
DELAY             [dD][eE][lL][aA][yY]":"
BINARY            [01]
COLON             ":"
IF                [iI][fF]
ELSE              [eE][lL][sS][eE]":"
ASSIGN            "="
EQUAL             "=="
NOTEQUAL          "!="
LESSEQ            "<="
GREATEREQ         ">="
LESSTHAN          "<"
GREATERTHAN       ">"
NUMBERS           [0-9]+
IDENTIFIER        [A-za-z_][A-Za-z0-9_]*
TAB               "\t"
WHITESPACE        [ \t\f\v\r\n]+
COMMENT           #

%x  sel del seg ifCond define

%%

 /* ignore all characters until \n occurs for single comments */
{COMMENT}[^\n]* { }

{WHITESPACE}        { }
{INIT}              { return INIT; }
{ELSE}              { return ELSE; }

 /* SEGMENT BINARIES */
<INITIAL>{BINARY} {
  reset_bin_prop();
  string_bin[seg_count] = yytext[0];
  seg_count++;
  BEGIN(seg);
}
<seg>{BINARY} {
  string_bin[seg_count] = yytext[0];
  seg_count++;
  if(seg_count == 8) {
    string_bin[seg_count] = '\0';
    yylval.string = string_bin;
    BEGIN(INITIAL);
    return BINARY;
  }
}
<seg>{TAB} { }
<seg>{WHITESPACE} { }

<INITIAL>{SELECT} { BEGIN(sel); return SELECT; }
<sel>{BINARY} {
  yylval.string = yytext;
  BEGIN(INITIAL);
  return NUMBER;
}
<sel>{NUMBERS} {
  yylval.string = yytext;
  BEGIN(INITIAL);
  return NUMBER;
}
<sel>{WHITESPACE} { }

<INITIAL>{DELAY} { BEGIN(del); return DELAY; }
<del>{BINARY} {
  yylval.string = yytext;
  BEGIN(INITIAL);
  return NUMBER;
}
<del>{NUMBERS} {
  yylval.string = yytext;
  BEGIN(INITIAL);
  return NUMBER;
}
<del>{WHITESPACE} { }

<INITIAL>{IF} {
  reset_str_prop();
  ifID = 0;
  BEGIN(ifCond);
  return IF;
}
 /* first id in this line, if idCond is 0 */
 /* second id in this line, if idCond is 1 */
<ifCond>{IDENTIFIER} {
  if (ifID == 0) {
    sprintf(string_buff_1, "%s", yytext);
    yylval.string = string_buff_1;
    ifID = 1;
  } else {
    sprintf(string_buff_2, "%s", yytext);
    yylval.string = string_buff_2;
  }
  return ID;
}
<ifCond>{EQUAL} { return EQUAL; }
<ifCond>{NOTEQUAL} { return NOTEQUAL; }
<ifCond>{LESSEQ} { return LESSEQ; }
<ifCond>{GREATEREQ} { return GREATEREQ; }
<ifCond>{LESSTHAN} { return LESSTHAN; }
<ifCond>{GREATERTHAN} { return GREATERTHAN; }
<ifCond>{NUMBERS} {
  sprintf(string_buff_2, "%s", yytext);
  yylval.string = string_buff_2;
  return NUMBER;
}
<ifCond>{WHITESPACE} { }
<ifCond>{COLON} { BEGIN(INITIAL); }

<INITIAL>{IDENTIFIER} {
  reset_str_prop();
  sprintf(string_buff_1, "%s", yytext);
  yylval.string = string_buff_1;
  BEGIN(define);
  return ID;
}
<define>{COLON} { }
<define>{WHITESPACE} { }
<define>{ASSIGN} { return (int)'='; }
<define>{IDENTIFIER} {
  sprintf(string_buff_2, "%s", yytext);
  yylval.string = string_buff_2;
  BEGIN(INITIAL);
  return ID;
}
<define>{NUMBERS} {
  sprintf(string_buff_2, "%s", yytext);
  yylval.string = string_buff_2;
  BEGIN(INITIAL);
  return NUMBER;
}

%%

int yywrap (void) { return 1; }

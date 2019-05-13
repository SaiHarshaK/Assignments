/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.
 */
%{
#include "y.tab.h"
%}

/*
 * Define names for regular expressions here.
 */

KING              K
QUEEN             Q
ROOK              R
BISHOP            B
KNIGHT            N
COLNUM            [a-h]
ROWNUM            [1-8]
SEPERATOR         [-x]
UPGRADE           =
WHITESPACE        [ \t\f\v\r\n]+

%x pawnUpState

%%

<INITIAL>{UPGRADE} { BEGIN(pawnUpState); return (int)'='; }
<pawnUpState>{KING} {
  yylval.chr = yytext[0];
  BEGIN(INITIAL);
  return PAWNUP;
}
<pawnUpState>{QUEEN} {
  yylval.chr = yytext[0];
  BEGIN(INITIAL);
  return PAWNUP;
}
<pawnUpState>{ROOK} {
  yylval.chr = yytext[0];
  BEGIN(INITIAL);
  return PAWNUP;
}
<pawnUpState>{BISHOP} {
  yylval.chr = yytext[0];
  BEGIN(INITIAL);
  return PAWNUP;
}
<pawnUpState>{KNIGHT} {
  yylval.chr = yytext[0];
  BEGIN(INITIAL);
  return PAWNUP;
}

  /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */

{KING}              { }
{QUEEN}             { }
{ROOK}              { }
{BISHOP}            { }
{KNIGHT}            { }
{COLNUM}            { yylval.chr = yytext[0]; return COL; }
{ROWNUM}            { yylval.num = atoi(yytext); return ROW; }
{SEPERATOR}         { return (int)'-'; }
{WHITESPACE}        { }

%%

int yywrap (void) { return 1; }

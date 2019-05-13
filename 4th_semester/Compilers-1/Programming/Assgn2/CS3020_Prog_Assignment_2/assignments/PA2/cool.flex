/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

int nest_level = 0; /* For keeping track for the nest level(depth) of comments */
int str_len = 0; /* keep count of length of string so as to check for overflow */
bool null_string = 1; /* true if string contains null */

 /* reset string buffer once the string is added to the table */
void reset_str_prop() {
  str_len = 0;
  null_string = false;
  memset(string_buf, 0, MAX_STR_CONST);
}

%}

/*
 * Define names for regular expressions here.
 */

DARROW            =>
SING_COMMENT      --
MULTI_COMM_START  \(\*
MULTI_COMM_END    \*\)
CLASS             [cC][lL][aA][sS][sS]
ELSE              [eE][lL][sS][eE]
FALSE             [f][aA][lL][sS][eE]
FI                [fF][iI]
IF                [iI][fF]
IN                [iI][nN]
INHERITS          [iI][nN][hH][eE][rR][iI][tT][sS]
ISVOID            [iI][sS][vV][oO][iI][dD]
LET               [lL][eE][tT]
LOOP              [lL][oO][oO][pP]
POOL              [pP][oO][oO][lL]
THEN              [tT][hH][eE][nN]
WHILE             [wW][hH][iI][lL][eE]
CASE              [cC][aA][sS][eE]
ESAC              [eE][sS][aA][cC]
NEW               [nN][eE][wW]
OF                [oO][fF]
NOT               [nN][oO][tT]
TRUE              [t][rR][uU][eE]
INT_CONST         [0-9]+
LE                <=
STR_CHECK         \"
ASSIGN            <-
TYPEID            [A-Z][a-zA-Z0-9_]*
OBJECTID          [a-z][a-zA-Z0-9_]*
WHITESPACE        [ \t\f\v\r]+
NEWLINE           \n
TILDE             ~
AT                @
MULT              \*
LEFT_PARAN        \(
RIGHT_PARAN       \)
SUBT              -
EQUAL             =
PLUS              \+
LEFT_BRAC         \{
RIGHT_BRAC        \}
COLON             :
SEMI_COLON        ;
COMMA             ,
PERIOD            \.
LT                <
DIV               \/

%x multi_comment str

%%

 /*
  *  Nested comments
  */

 /* ignore all characters until \n occurs for single comments */
{SING_COMMENT}[^\n]* { }

<INITIAL>{MULTI_COMM_START} { nest_level++; BEGIN(multi_comment); }
<INITIAL>{MULTI_COMM_END} {
  cool_yylval.error_msg = "Unmatched *)";
  return ERROR;
}

<multi_comment>{MULTI_COMM_START} { nest_level++; }
<multi_comment>{MULTI_COMM_END} {
  nest_level--;
  if(nest_level == 0) BEGIN(INITIAL);
}
<multi_comment>. {}
<multi_comment>[\n] { curr_lineno++; }
<multi_comment><<EOF>> { /* error handling */
  cool_yylval.error_msg = "EOF in comment.";
  BEGIN(INITIAL);
  return ERROR;
}

 /*
  *  The multiple-character operators.
  */

{DARROW}		{ return (DARROW); }

 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */

{CLASS} { return (CLASS); }
{ELSE} { return (ELSE); }
{FI} { return (FI); }
{IF} { return (IF); }
{IN} { return (IN); }
{INHERITS} { return (INHERITS); }
{ISVOID} { return (ISVOID); }
{LET} { return (LET); }
{LOOP} { return (LOOP); }
{POOL} { return (POOL); }
{THEN} { return (THEN); }
{WHILE} { return (WHILE); }
{CASE} { return (CASE); }
{ESAC} { return (ESAC); }
{NEW} { return (NEW); }
{OF} { return (OF); }
{NOT} { return (NOT); }
{ASSIGN} { return (ASSIGN); }
{LE} { return (LE); }

{FALSE} {
  cool_yylval.boolean = 0;
  return (BOOL_CONST);
}
{TRUE} {
  cool_yylval.boolean = 1;
  return (BOOL_CONST);
}
{INT_CONST} {
  cool_yylval.symbol = inttable.add_string(yytext);
  return (INT_CONST);
}
{TYPEID} {
  cool_yylval.symbol = idtable.add_string(yytext);
  return (TYPEID);
}
{OBJECTID} {
  cool_yylval.symbol = idtable.add_string(yytext);
  return (OBJECTID);
}

 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for
  *  \n \t \b \f, the result is c.
  *
  */

{STR_CHECK} { reset_str_prop(); BEGIN(str);  }

 /* escaped sequence */
<str>\\n { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '\n'; }
<str>\\t { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '\t'; }
<str>\\b { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '\b'; }
<str>\\f { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '\f'; }
<str>\\\n {
  curr_lineno++;
}

 /* other characters */
<str>\\\" { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '"'; }
<str>\\\\    { if (str_len < MAX_STR_CONST - 1) string_buf[str_len++] = '\\'; }

 /* error checking */
<str>\n {
  cool_yylval.error_msg = "Unterminated string constant";
  curr_lineno++;
  BEGIN(INITIAL);
  return ERROR;
}
<str>\0 {
  cool_yylval.error_msg = "Null character in string.";
  null_string = true;
  BEGIN(INITIAL);
  return ERROR;
}
<str>\\\0 {
  cool_yylval.error_msg = "Null character in string.";
  null_string = true;
  BEGIN(INITIAL);
  return ERROR;
}

<str><<EOF>> {
  cool_yylval.error_msg = "EOF in string constant.";
  BEGIN(INITIAL);
  return ERROR;
}
<str>{STR_CHECK} {
  BEGIN(INITIAL);
  if (str_len > MAX_STR_CONST - 1) {
    cool_yylval.error_msg = "String constant too long";
    return ERROR;
  } else if (!null_string) {
    if (str_len <= MAX_STR_CONST - 1) string_buf[str_len] = '\0';
    cool_yylval.symbol = stringtable.add_string(string_buf);
    return (STR_CONST);
  }
}
 /* error checking ends */

<str>\\      {  }
<str>. { if (str_len < MAX_STR_CONST - 1) {}string_buf[str_len++] = *yytext; }

{WHITESPACE}        { }
{NEWLINE}           { curr_lineno++; }
{TILDE}             { return (int)'~'; }
{AT}                { return (int)'@'; }
{MULT}              { return (int)'*'; }
{LEFT_PARAN}        { return (int)'('; }
{RIGHT_PARAN}       { return (int)')'; }
{SUBT}              { return (int)'-'; }
{EQUAL}             { return (int)'='; }
{PLUS}              { return (int)'+'; }
{LEFT_BRAC}         { return (int)'{'; }
{RIGHT_BRAC}        { return (int)'}'; }
{COLON}             { return (int)':'; }
{SEMI_COLON}        { return (int)';'; }
{COMMA}             { return (int)','; }
{PERIOD}            { return (int)'.'; }
{LT}                { return (int)'<'; }
{DIV}               { return (int)'/'; }

. {
  cool_yylval.error_msg = yytext;
  return ERROR;
}

%%

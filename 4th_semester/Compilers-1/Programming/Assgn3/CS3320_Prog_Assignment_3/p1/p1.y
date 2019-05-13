%{
/* int yydebug=1; */    /* For debugging */
#include <stdio.h>      /* C declarations used in actions */
#include <stdlib.h>
extern "C" int yyparse(void);
extern "C" int yylex(void);
extern "C" void yyerror (const char *s);
char chessBoard[64];
int colToNum(char colum);
int rowToNum(int row);
void chessBoardUpdate(int pos1, int pos2);
void chessBoardUpdUpg(int pos1, int pos2, char pieceId);
%}

%union { int num; char chr; }         /* Yacc definitions */
%start  MOVE
%token  <num>  ROW
%token  <chr>  COL PAWNUP
%type   <num>  MOVE POS

%%

/* descriptions of expected inputs     corresponding actions (in C) */

MOVE    : POS '-' POS   {  printf("noootoo\n");chessBoardUpdate($1, $3); }
        | POS '-' POS '=' PAWNUP   { chessBoardUpdUpg($1, $3, $5); }
        | MOVE POS '-' POS   { printf("thissep\n");chessBoardUpdate($2, $4); }
        | MOVE POS '-' POS '=' PAWNUP   { chessBoardUpdUpg($2, $4, $6); }
        ;

/* Using row number and column id as offset we can get the position on chessboard */
POS     : COL ROW { $$ = colToNum($1) + rowToNum($2); }
        ;

%%                     /* C code */

/* updates the position of chess piece from pos1 to pos2 */
void chessBoardUpdate(int pos1, int pos2)
{
  chessBoard[pos2] = chessBoard[pos1];
  chessBoard[pos1] = ' ';
  printf("%d\n", pos1);
}

/* updates the position of chess piece from pos1 to pos2, and upgrades the piece to pieceId */
void chessBoardUpdUpg(int pos1, int pos2, char pieceId)
{
  chessBoard[pos2] = pieceId;
  chessBoard[pos1] = ' ';
}

/* Note: row numbers are 1-index based so we add -1 to make it 0-index */
int rowToNum(int row) {
  return ((row - 1) * 8);
}

/* colum char to int, to get position of piece */
int colToNum(char colum) {
  return (colum - 'a');
}


int main (void) {
  /* init chess table */
  /* all special chess pieces */
  chessBoard[0] = chessBoard[7] = chessBoard[56] = chessBoard[63] = 'R';
  chessBoard[1] = chessBoard[6] = chessBoard[57] = chessBoard[62] = 'N';
  chessBoard[2] = chessBoard[5] = chessBoard[58] = chessBoard[61] = 'B';
  chessBoard[3] = chessBoard[59] = 'Q';
  chessBoard[4] = chessBoard[60] = 'K';
  /* pawns */
  for(int i = 8; i < 16; i++) {
    chessBoard[i] = chessBoard[40 + i] = 'P';
  }
  /* blank */
  for(int i = 16; i < 48; i++) {
    chessBoard[i] = ' ';
  }

  int ret = yyparse ( );

  /* print the chess board state */
  /* Col headers */
  printf(" \ta\tb\tc\td\te\tf\tg\th");
  /* Print Row */
  for(int i = 0; i < 64; i++) {
    if (i % 8 == 0) { /* Row id */
      printf("\n\n%d", (i / 8) + 1);
    }
    printf("\t%c", chessBoard[i]);
  }

  return ret;
}

void yyerror (const char *s) {fprintf (stderr, "%s\n", s);}

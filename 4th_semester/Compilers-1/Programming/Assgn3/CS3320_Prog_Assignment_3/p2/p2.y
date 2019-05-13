%{
/* int yydebug=1; */    /* For debugging */
#include <stdio.h>      /* C declarations used in actions */
#include <stdlib.h>
#include <string.h>
void yyerror (char *s);
int yyparse(void);
int yylex(void);

int declare_assign = 0;         /* 0 if no varible assignment, else number of var assignments */
int first_select = 0;           /* 0 is first select, 1 afterwards */
int ifElseMode = 0;             /* 0 if outside if-else, otherwise 1 */
char op[4];
char vars[512][256];
void generateInit();
void declareVar(char* type, char* id);
void assignNumToVar(char* id1, char* num);
void assignIdToVar(char* id1, char* id2);
void writeWhile();
void writeAssigns();
void writeSelect(char* num);
void assignOp(char ops[4]);
void writeIfCond(char* id1, char* id2);
void writeDisp(char* disp);
void writeElseCond();
void writeDelay(char* num);

%}

%union { char* string; }         /* Yacc definitions */
%start  LINE
%token  <string> ID NUMBER BINARY
%token  SELECT DELAY IF ELSE INIT
%token  EQUAL NOTEQUAL LESSEQ GREATEREQ LESSTHAN GREATERTHAN

%type <string>  TERM

%%

/* descriptions of expected inputs     corresponding actions (in C) */

LINE    : INIT { generateInit(); }
        | LINE ID ID { declareVar($3, $2); }
        | LINE ID '=' NUMBER   { assignNumToVar($2, $4); }
        | LINE ID '=' ID   { assignIdToVar($2, $4); }
        | LINE SELECT NUMBER { writeSelect($3); }
        | LINE DELAY NUMBER { writeDelay($3); }
        | LINE IF ID OP TERM { writeIfCond($3, $5); }
        | LINE ELSE { writeElseCond(); }
        | LINE BINARY { writeDisp($2); }
        ;

TERM    : ID { $$ = $1; }
        | NUMBER { $$ = $1; }
        ;

OP      : EQUAL { assignOp("=="); }
        | NOTEQUAL { assignOp("!="); }
        | LESSEQ { assignOp("<="); }
        | GREATEREQ { assignOp(">="); }
        | LESSTHAN { assignOp("<"); }
        | GREATERTHAN { assignOp(">"); }
        ;

%%                     /* C code */

/* write the header files, main and other declarations */
void generateInit() {
  printf("#include<stdio.h>\n");
  printf("#include<stdlib.h>\n");
  printf("#include<seven_segment.h>\n");
  printf("int main()\n");
  printf("{\n");
  printf("\tinit();\n");
}

/* write the declarations */
void declareVar(char* type, char* id) {
  printf("\t%s %s;\n", type, id);\
}

/* store the assignments to variables until all vars are assigned */
void assignNumToVar(char* id1, char* num) {
  sprintf(vars[declare_assign], "\t\t%s = %s;\n", id1, num);
  declare_assign++;
}

/* store the assignments(identifier) to variables until all vars are assigned */
void assignIdToVar(char* id1, char* id2) {
  sprintf(vars[declare_assign], "\t\t%s = %s();\n", id1, id2);
  declare_assign++;
}

/* writes while(1) { is pretty way */
void writeWhile() {
  printf("\twhile(1);\n");
  printf("\t{\n");
}

/* writes the variable assignments if any */
void writeAssigns() {
  if (declare_assign == 0) return;
  for (int ind = 0; ind < declare_assign; ind++) {
    printf("%s", vars[ind]);
  }
}

/* Write select(x); where x is the given number  */
void writeSelect(char* num) {
  if (first_select == 0) {
    first_select = 1;
    writeWhile();
    writeAssigns();
  }
  printf("\t\tselect(%s);\n", num);
}

/* Write delay(x); where x is the given number  */
void writeDelay(char* num) {
  printf("\t\tdelay(%s);\n", num);
}

/* Store operator */
void assignOp(char ops[4]) {
  sprintf(op, "%s", ops);
}

/* Writes IF condition */
void writeIfCond(char* id1, char* id2) {
  ifElseMode = 1;
  printf("\t\tif(%s%s%s)\n", id1, op, id2);
  printf("\t\t{\n");
}

/* Writes ELSE condition */
void writeElseCond() {
  ifElseMode = 1;
  printf("\t\telse\n");
  printf("\t\t{\n");
}

void writeDisp(char* disp) {
  if (ifElseMode == 1) {
    printf("\t\t\twrite(strtol(\"%s\"));\n", disp);
    printf("\t\t}\n");
    ifElseMode = 0;
  }
  else printf("\t\twrite(strtol(\"%s\"));\n", disp);
}

int main (void) {
  int ret = yyparse ( );

  printf("\t}\n");
  printf("}\n");

  return ret;
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}

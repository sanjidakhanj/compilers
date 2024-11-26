%{
#include<stdio.h>

int yylex (void);
extern int yyparse();
extern FILE* yyin;

void yyerror (char const *);
%}

%define api.value.type {int}

%token NUM  
%token NEWLINE
%start input

%left '&'
%left '|'
%left '!'

%%

input:
  %empty
| input line
;

line:
  NEWLINE
| exp NEWLINE {printf("%s\n", $1 ? "TRUE" : "FALSE");}
;

exp:
  NUM
| exp exp '&' {$$ = $1 && $2;}
| exp exp '|' {$$ = $1 || $2;}
| exp '!' {$$ = !$1 ;}

%%


void yyerror (char const *s){
  fprintf(stderr, "%s\n",s);
}

int main(void){
  yyin = stdin;
  do {
	yyparse();
  } while (!feof(yyin));
  return 0;
}

  

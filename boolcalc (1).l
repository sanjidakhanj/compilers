%{
   #include <stdio.h>
   #include "boolcalc.tab.h"
%}
%option noyywrap

%%

[ \t] ;
[01]|[tT][rR][uU][eE]|[fF][aA][lL][sS][eE] {yylval = (*yytext == '1' ||*yytext == 't'|| *yytext == 'T')? 1 : 0 ; return NUM;}
\n                {return NEWLINE;}
[&|!]             {return *yytext;}
.                           {fprintf(stderr,"Invalid character: %s\n", yytext);}


%%

/* File Parser.mly */
%{
	open love
%}

%token <string> WORD
%token CONCAT EXP_END EOL PROG_END
%left CONCAT
%start main1
%type <love.results> main1
%%
/*
main: prog PROG_END EOL { $1 }
;

prog:  
| wordExpr EXP_END EOL { $1 }
| wordExpr EXP_END EOL prog { $1 ^"\n" ^ $4 }
| wordExpr EXP_END prog { $1 ^"\n" ^ $3 }
;

wordExpr: 
| WORD { $1 }
| wordExpr CONCAT wordExpr { $1^$3 }
;
*/
/**/
main1 : prog1 PROG_END EOL { $1 }
;

prog1:  
| wordExpr1 EXP_END EOL { Word($1) }
| wordExpr1 EXP_END EOL prog1 { MoreWords( Word($1), $4) }
| wordExpr1 EXP_END prog1 { MoreWords( Word($1), $3) }
;

wordExpr1: 
| WORD { $1 }
| wordExpr1 CONCAT wordExpr1 { $1^$3 }
;
/**/
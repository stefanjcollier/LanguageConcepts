/* File Parser.mly */
%{
	open Path
%}

%token <string> WORD
%token CONCAT EXP_END EOL PROG_END
%token LCURL RCURL EMPTY_SET COMMA
%left CONCAT
%start main
<<<<<<< HEAD
%type <Path.generic> main
%%

main : prog PROG_END EOL { $1 }
=======
%type <Path.results> main
%%
/*
main: prog PROG_END EOL { $1 }
>>>>>>> 6fa221a725696cf60c78d7bb34f10f6c943dd5f6
;


prog:
| languageExpr EXP_END EOL { GenL($1) }
| languageExpr EXP_END EOL prog { GenMulti( GenL($1), $4) }
| languageExpr EXP_END prog { GenMulti( GenL($1), $3) }
| wordExpr EXP_END EOL { GenW($1) }
| wordExpr EXP_END EOL prog { GenMulti( GenW($1), $4) }
| wordExpr EXP_END prog { GenMulti( GenW($1), $3) }
;
*/

<<<<<<< HEAD
languageExpr :
 |LCURL langbody RCURL 		{ $2 }
 |EMPTY_SET					{ EmptySet }
 ;

 langbody :
 | wordExpr COMMA langbody	{ Cons ( $1 , $3)}
 | wordExpr					{ Cons ( $1, EmptySet)}

=======
main : prog PROG_END EOL { $1 }
;

prog:  
| wordExpr EXP_END EOL { Word($1) }
| wordExpr EXP_END EOL prog { MoreWords( Word($1), $4) }
| wordExpr EXP_END prog { MoreWords( Word($1), $3) }
;
>>>>>>> 6fa221a725696cf60c78d7bb34f10f6c943dd5f6
wordExpr: 
| WORD { $1 }
| wordExpr CONCAT wordExpr { $1^$3 }
;


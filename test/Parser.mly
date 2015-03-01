/* File Parser.mly */
%{
	open Path
%}

%token <string> WORD
%token CONCAT EXP_END EOL PROG_END
%token LCURL RCURL EMPTY_SET COMMA
%left CONCAT
%start main
%type <Path.generic> main
%%

main : prog PROG_END EOL { $1 }
;


prog:
| languageExpr EXP_END EOL { GenL($1) }
| languageExpr EXP_END EOL prog { GenMulti( GenL($1), $4) }
| languageExpr EXP_END prog { GenMulti( GenL($1), $3) }
| wordExpr EXP_END EOL { GenW($1) }
| wordExpr EXP_END EOL prog { GenMulti( GenW($1), $4) }
| wordExpr EXP_END prog { GenMulti( GenW($1), $3) }
;

languageExpr :
 |LCURL langbody RCURL 		{ $2 }
 |EMPTY_SET					{ EmptySet }
 ;

 langbody :
 | wordExpr COMMA langbody	{ Cons ( $1 , $3)}
 | wordExpr					{ Cons ( $1, EmptySet)}

wordExpr: 
| WORD { $1 }
| wordExpr CONCAT wordExpr { $1^$3 }
;


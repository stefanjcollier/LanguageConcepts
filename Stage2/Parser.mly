/* File Parser.mly */
%{
	open Path
%}

%token <string> WORD
%token CONCAT EXP_END EOL PROG_END
%token LCURL RCURL EMPTY_SET COMMA
%token UNION
%token OUTPUT INTERSECT SUBTRACT
%left CONCAT UNION INTERSECT SUBTRACT
%start main
%type <Path.program> main
%%

main: prog PROG_END EOL { $1 }
;

prog:
| expr EXP_END EOL { $1 }
| expr EXP_END EOL prog { GenMulti( $1, $4) }
| expr EXP_END prog { GenMulti( $1, $3) }
;

expr : 
| languageExpr 		{ GenL($1) }
| wordExpr 			{ GenW($1) }
| OUTPUT languageExpr { Output($2) }
;

languageExpr :
 | LCURL langbody RCURL 		{ $2 }
 | EMPTY_SET					{ EmptySet }
 | languageExpr UNION languageExpr { Union($1, $3) }
 ;

 langbody :
 | wordExpr COMMA langbody	{ Cons ( $1 , $3)}
 | wordExpr					{ Cons ( $1, EmptySet)}

wordExpr: 
| WORD { $1 }
| wordExpr CONCAT wordExpr { $1^$3 }
;


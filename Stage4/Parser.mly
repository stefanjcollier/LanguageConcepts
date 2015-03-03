/* File Parser.mly */
%{
	open Path
%}

%token <int> INT
%token <string> WORD
%token <string> INT_VAR
%token <string> WORD_VAR
%token <string> LANG_VAR
%token EXP_END EOL PROG_END
%token LCURL RCURL EMPTY_SET COMMA EQUALS
%token CONCAT
%token UNION INTERSECT SUBTRACT
%token OUTPUT 

%left UNION INTERSECT SUBTRACT
%left CONCAT 
%start main
%type <Path.program> main
%%

main: prog PROG_END EOL { $1 }
;

prog:
 | expr EXP_END EOL { $1 }
 | expr EXP_END EOL prog { Statements( $1, $4) }
 | expr EXP_END prog { Statements( $1, $3) }
;

expr : 
 | languageExpr 		{ Statement($1) }
 | wordExpr 			{ WStatement($1) }
 | OUTPUT languageExpr { Output($2) }
 | dec {Declaration( $1 )}
;

dec:
 | LANG_VAR EQUALS languageExpr { LangDeclaration ($1, $3) }
 | WORD_VAR EQUALS wordExpr { WordDeclaration ($1, $3) }
 | INT_VAR EQUALS INT { IntDeclaration ($1, $3) }
 ;


languageExpr :
 | LCURL langbody RCURL 		{ LangLiteral($2) }
 | EMPTY_SET					{ LangLiteral(Empty_Set) }
 | LANG_VAR { LangVariable ( $1 ) }
 | languageExpr UNION languageExpr { Union($1, $3) }
 | languageExpr INTERSECT languageExpr { Intersection($1, $3) }
 | languageExpr SUBTRACT languageExpr { Subtraction($1, $3) }
 | languageExpr CONCAT languageExpr { LangConcat($1, $3) }
;

langbody :
 | wordExpr					{ Cons ($1, Empty_Set)}
 | wordExpr COMMA langbody	{ Cons ($1, $3)}
;

wordExpr: 
 | WORD { WordLiteral ($1) }
 | wordExpr CONCAT wordExpr { WordConcat($1, $3) }
 | WORD_VAR { WordVarialbe ($1) } 
;

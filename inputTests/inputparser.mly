%{
	open Path

%}

%token <int> INT
%token <string> WORD
%token LCURL RCURL EMPTY_SET COMMA
%token EOL 

%start main
%type <Path.input> main
%%

main : inp { $1 }
;

inp :
 | lang_literal EOL inp { MultiLangauges($1, $3)}
 | INT 					{ Integer($1) }
;

lang_literal :
| LCURL lang_body RCURL	 { $2 }

lang_body :
 | wordExpr						{ Cons ($1, Empty_Set)}
 | wordExpr COMMA lang_body	{ Cons ($1, $3)}
;

wordExpr: 
 | WORD { WordLiteral ($1) }
;
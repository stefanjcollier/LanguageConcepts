%{
  open LOVE
}%

%token <int> INT
%token <string> WORD
%token INT_VAR WORD_VAR LANG_VAR 
%token LCURL COMMA RCURL EMPTY_SET 
%token UNION INTERSECT SUBTRACT
%token CONCAT
%token FIRST LAST
%token DEC EQUALS
%token OUTPUT EXPR_END

%left CONCAT 
%left UNION INTERSECT SUBTRACT

%start main
%type ? main
%%
main :
	program { $1 }
;

program : 
| expr { $1 }
| expr program { $1 $2 }
;;
expr : 
| language EXPR_END { $1 }
| miscFunc { $1 }
;;

language :
 |LCURL langbody RCURL 		{ $2 }
 |EMPTY_SET					{ EmptySet }
 |language langfunc language	{ $2 ($1, $3)}
 |FIRST INT language			{ First( $2, $3) }
 |LAST INT language				{ Last( $2, $3) }
 (*|LANG_VAR *)
;
langbody :
 | word COMMA langbody	{ Cons ( Word $1 , $3)}
 | word					{ Cons ( Word $1, EmptySet)}
;  

word : 
 | WORD 			{ Word($1)}
 | word CONCAT word { Concat ($1, $3)}
 (*| WORD_VAR *)
(* 
 | WORD STAR
 | WORD PLUS
*)
;
langfunc : 
 | UNION 		{ Union }
 | INTERSECT 	{ Intersection }
 | SUBTRACT 	{ Subtraction }
;

miscFunc:
| OUTPUT language { Output $2 }

(*
(* These will add a new entry to our variable tables*)
declare : 
 | DEC LAND_VAR
 | DEC WORD_VAR
 | DEC INT_VAR
;

redeclare :
 | LANG_VAR EQUALS language
 | WORD_VAR EQUALS word
 | INT_VAR EQUALS INT
;
*)


(*
errors:
 | word CONCAT language 
 | language CONCAT word { failwith specific_concat_problem }
 | 
*)










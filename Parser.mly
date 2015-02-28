%{

}%

%token

%start main
%type ? main
%%
main :
	?
;

language :
 |LCURL langbody RCURL 		{}
 |EMPTY_SET			{}
 |language langfunc language	{}
 |FIRST INT language		{}
 |LAST INT language		{}
 (*|LANG_VAR *)
;

langbody :
 | word COMMA langbody	{}
 | word	{}
;

word : 
 | WORD
 | word CONCAT word
 (*| WORD_VAR *)
(* 
 | WORD STAR
 | WORD PLUS
*)
;
langfunc : 
 | UNION 
 | INTERSECT 
 | SUBTRACT
(* Powerset? *)
;
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










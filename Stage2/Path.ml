module WordSet = Set.Make(String);;
let lang_hash = Hashtbl.create 100;;
let word_hash = Hashtbl.create 100;;
let int_hash = Hashtbl.create 100;;

type lang_literal =
 | Empty_Set
 | Cons of (string * lang_literal)
;;

type language =
 | LangLiteral of lang_literal
 | LangVariable of string
 | Union of (language * language)
 | Intersection of (language * language)
 | Subtraction of (language * language)
;; 

type decs = 
 | IntDeclaration of (string * int)
 | WordDeclaration of (string * string)
 | LangDeclaration of (string * language)
;;

type program =
 | Output of language
 | Declaration of decs
 | Statement of language
 | WStatement of string
 | Statements of (program * program)
;;




 (* Converts the data type into a set *)
let rec convert_literal_lang = function
 | Empty_Set -> WordSet.empty 
 | Cons (word, more) -> WordSet.add word ( convert_literal_lang more )
;;
 

(* Retrieves the set ascociated with the variable or derived from the literal 
   @Returns a SET*)
let rec solve_lang = function
 | LangLiteral(lit) -> 		convert_literal_lang lit
 | LangVariable(var) -> 	Hashtbl.find lang_hash var
 | Union (l1, l2) -> 		WordSet.union (solve_lang l1) (solve_lang l2)
 | Intersection (l1, l2) -> WordSet.inter (solve_lang l1) (solve_lang l2) 
 | Subtraction (l1, l2) -> 	WordSet.diff  (solve_lang l1) (solve_lang l2) 
;;

let redeclare = function
 | LangDeclaration(str , vl) -> Hashtbl.replace lang_hash str (solve_lang vl)
 | WordDeclaration(str, vl) -> Hashtbl.replace  word_hash str  vl
 | IntDeclaration(str, vl) -> Hashtbl.replace   int_hash  str  vl
;;

let language_to_string lang = 
	let rec aux (lst:string list) = 
	match lst with
 		| [] -> "}"
 		| [x] -> x^"}"
 		| h::t -> h^", "^(aux t)
	 in
	 "{"^aux (WordSet.elements (solve_lang lang))^"\n" 
;;
(* Takes a WordSet obj and print_string's a set *)
let print_language lang =
	 print_string (language_to_string lang)
;;


let print_language_max max lang =
	let rec aux (lst:string list) accum = 
	match lst with
 		| [] -> "}"
 		| [x] -> (x^"}")
 		| h::t -> if accum+1 = max 
 				then h^"}" 
 				else h^", "^aux t (accum+1)
	 in
	 print_string (("{"^aux(WordSet.elements (solve_lang lang)) 0)^"\n")
;;

let rec interpret (prog:program) =
	match prog with
	| Output (lang)-> (print_language lang); 
	| Declaration(decObj) -> redeclare decObj;
	| Statement( lang )-> print_string ("unassigned lang: "^(language_to_string lang)); 
	| WStatement( word )-> print_string ("unassigned word:"^word^"\n");

	| Statements ( head, tail ) -> interpret head; interpret tail;
;;

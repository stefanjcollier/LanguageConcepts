module WordSet = Set.Make(String);;
let lang_hash = Hashtbl.create 100;;
let word_hash = Hashtbl.create 100;;
let int_hash = Hashtbl.create 100;;
let variable_counter = ref 0;;
let word_limit = ref 1000;;

type word = 
 | WordLiteral of string
 | WordVarialbe of string
 | Concat of (word * word)
;;

type lang_literal =
 | Empty_Set
 | Cons of (word * lang_literal)
;;

type language =
 | LangLiteral of lang_literal
 | LangVariable of string
 | Union of (language * language)
 | Intersection of (language * language)
 | Subtraction of (language * language)
;;

type integer = 
| IntLiteral of int
| IntVariable of string
;;
type decs = 
 | IntDeclaration of (string * int)
 | WordDeclaration of (string * word)
 | LangDeclaration of (string * language)
;;

type program =
 | Output of language
 | Declaration of decs
 | Statement of language
 | WStatement of word
 | Statements of (program * program)
;;

type input = 
 | Integer of int
 | MultiLangauges of (lang_literal * input)
;;

let rec solve_word = function
 | WordLiteral(str) -> str
 | WordVarialbe(var) -> Hashtbl.find word_hash var
 | Concat(w1, w2) -> (solve_word w1)^(solve_word w2)
;;

 (* Converts the data type into a set *)
let rec convert_literal_lang = function
 | Empty_Set -> WordSet.empty 
 | Cons (word, more) -> WordSet.add (solve_word word) ( convert_literal_lang more )
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
 | WordDeclaration(str, vl) -> Hashtbl.replace  word_hash str  (solve_word vl)
 | IntDeclaration(str, vl) -> Hashtbl.replace   int_hash  str  vl
;;

let language_of_string lang = 
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
	 print_string (language_of_string lang)
;;


let output_language (lang:language) =
	let rec aux (lst:string list) accum = 
	match lst with
 		| [] -> "}"
 		| [x] -> (x^"}")
 		| h::t -> if accum+1 = !word_limit 
 				then h^"}" 
 				else h^", "^aux t (accum+1)
	 in
	 print_string (("{"^aux(WordSet.elements (solve_lang lang)) 0)^"\n")
;;

let rec interpret (prog:program) =
	match prog with
	| Output (lang)-> (output_language lang); 
	| Declaration(decObj) -> redeclare decObj;
	| Statement( lang )-> print_string ("unassigned lang: "^(language_of_string lang)); 
	| WStatement( word )-> print_string ("unassigned word:"^(solve_word word)^"\n");
	| Statements ( head, tail ) -> interpret head; interpret tail
;;


let add_input_lang lang = 
	variable_counter := (!variable_counter + 1);
	let name = "@Lang"^(string_of_int !variable_counter )in
		Hashtbl.replace lang_hash name (solve_lang lang)
;;

let rec encorperate (inp:input) = 
	match inp with
	| MultiLangauges( lang_lit, more ) -> add_input_lang (LangLiteral(lang_lit)); encorperate more;
	| Integer( num ) -> word_limit := num;
;;

let main prog inp = 
	 encorperate inp; interpret prog; 	
;;
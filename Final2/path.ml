open Str

module WordSet = Set.Make(String);;

let lang_hash = Hashtbl.create 100;;
let word_hash = Hashtbl.create 100;;

let variable_counter = ref 0;;
let word_limit = ref 1024;;



type word = 
 | WordLiteral of string
 | WordVarialbe of string
 | WordConcat of (word * word)
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
 | LangConcat of (language * language)
 | OnlyRegex of (language * string)
 | RemoveRegex of (language * string)
 | Star of language
;;

type decs = 
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

exception Unrecognised_Language_identifier of string ;;
exception Unrecognised_Word_identifier of string ;;
exception Incorrect_Input_Structure of int;;
exception Invalid_concatination of (string * language);;
exception Invalid_declaration of string;;

let lookup_lang identifier =
	try
		Hashtbl.find lang_hash identifier
	with Not_found ->
 		raise (Unrecognised_Language_identifier ("The exists no language with identifier: "^identifier))
 ;;

let lookup_word identifier = 
	try
		Hashtbl.find word_hash identifier
	with Not_found ->
 		raise (Unrecognised_Word_identifier ("The exists no word with identifier: "^identifier))
 ;;


let tidy (inp:string) =
	if inp  = ":"
	then
		inp
	else
		Str.global_replace (Str.regexp ":")  ""	inp
;;

let solve_word wrd =
	let rec aux = function
	 | WordLiteral(str) -> str
	 | WordVarialbe(var) -> lookup_word var
	 | WordConcat(w1, w2) -> (aux w1)^(aux w2)
	in
	tidy (aux wrd)
;;

 (* Converts the data type into a set *)
let rec convert_literal_lang = function
 | Empty_Set -> WordSet.empty 
 | Cons (word, more) -> WordSet.add (solve_word word) ( convert_literal_lang more )
;;

let rec addWord (lst:string list) (wrd:string) =
 	match lst with
	| [] -> []
	| [x] -> [tidy (x^wrd)]
	| h::t -> (tidy (h^wrd))  ::  addWord t wrd
;; 

let rec list_concat l1 l2 =
	match l1,l2 with
	| [],_ -> []
	| _,[] -> []
	| [x],_ -> addWord l2 x
	| h::t,_ -> List.append (addWord l2 h) (list_concat t l2) 
;;

let lang_concat s1 s2 =
	let res = list_concat (WordSet.elements s2) (WordSet.elements s1) in
	List.fold_right WordSet.add res WordSet.empty
;;

let kleen_star lang =
	let rec lang_pow_n n =
		if n = 1 
			then lang
			else lang_concat lang (lang_pow_n (n-1))
	in 
	let rec add_new_power index =
		if index = 0
			then WordSet.singleton ":"
			else WordSet.union (lang_pow_n index) (add_new_power (index-1))
	in
	add_new_power (!word_limit)
;;

(* Retrieves the set ascociated with the variable or derived from the literal 
   @Returns a SET*)
let rec solve_lang = function
 | LangLiteral(lit) -> 		convert_literal_lang lit
 | LangVariable(var) -> 	lookup_lang var
 | Union (l1, l2) -> 		WordSet.union (solve_lang l1) (solve_lang l2)
 | Intersection (l1, l2) -> WordSet.inter (solve_lang l1) (solve_lang l2) 
 | Subtraction (l1, l2) -> 	WordSet.diff  (solve_lang l1) (solve_lang l2)
 | LangConcat (l1, l2) ->  lang_concat (solve_lang l1) (solve_lang l2)
 | OnlyRegex (l, reg) -> WordSet.filter (fun str -> (Str.string_match (Str.regexp (String.sub reg 1 ((String.length reg) - 2)))) str 0) (solve_lang l)
 | RemoveRegex (l, reg) -> WordSet.diff (solve_lang l) (WordSet.filter (fun str -> (Str.string_match (Str.regexp (String.sub reg 1 ((String.length reg) - 2)))) str 0) (solve_lang l))
 | Star (l) -> kleen_star (solve_lang l)
;;

let redeclare = function
 | LangDeclaration(str , vl) -> Hashtbl.replace lang_hash str (solve_lang vl)
 | WordDeclaration(str, vl) -> Hashtbl.replace  word_hash str  (solve_word vl)
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

let set_word_limit num =
	if num < 1
	then raise (Incorrect_Input_Structure num)
	else word_limit := num
	
;;

let rec encorperate (inp:input) = 
	match inp with
	| MultiLangauges( lang_lit, more ) -> add_input_lang (LangLiteral(lang_lit)); encorperate more;
	| Integer( num ) -> set_word_limit num
;;

let main prog inp = 
	 encorperate inp; interpret prog; 	
;;
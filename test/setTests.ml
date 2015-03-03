module WordSet = Set.Make(String);;

type lang_literal =
 | Empty_Set
 | Cons of (string * lang_literal)
;;

type language =
 | LangLiteral of lang_literal
 | LangVariable of string
;;

(* Verison 1 - only lang*lang *)
type lang_func = 
 | Union of (language * language)
 | Intersection of (language * language)
 | Subtraction of (language * language)
;;

type 

type program =
 | Statement of lang_func
 | Statements of (lang_func * program)
;;

 (* Converts the data type into a set *)
let rec convert_literal_lang = function
 | Empty_Set -> WordSet.empty 
 | Cons (word, more) -> WordSet.add word ( convert_literal_lang more )
;;

let lookup_lang = function
| _ -> WordSet.empty
;;

(* Retrieves the set ascociated with the variable or derived from the literal *)
let get_lang = function
 | LangLiteral(lit) -> convert_literal_lang lit
 | LangVariable(var) -> lookup_lang var
;;

let solve_lang_function func =  function
 | Union (l1, l2) -> 		WordSet.union (get_lang l1) (get_lang l2)
 | Intersection (l1, l2) -> WordSet.inter (get_lang l1) (get_lang l2) 
 | Subtraction (l1, l2) -> 	WordSet.diff (get_lang l1) (get_lang l2) 
;;

(* Takes a WordSet obj and print_string's a set *)
let print_language lang =
	let rec aux (lst:string list) = 
	match lst with
 		| [] -> "}"
 		| [x] -> x^"}"
 		| h::t -> h^", "^(aux lst)
	 in
	 print_string ("{"^aux (WordSet.elements lang) )
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
	 print_string ("{"^aux(WordSet.elements lang) 0)
;;




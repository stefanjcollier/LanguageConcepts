module WordSet = Set.Make(String);;

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

type program =
 | Output of language
 | LangDeclaration of (string * language)
 | WordDeclaration of (string * string)
 | IntDeclaration of  (string * int)
 | Statement of language
 | Statements of (program * program)
;;

 (* Converts the data type into a set *)
let rec convert_literal_lang = function
 | Empty_Set -> WordSet.empty 
 | Cons (word, more) -> WordSet.add word ( convert_literal_lang more )
;;

let lookup_lang  = function
| _ -> WordSet.empty
;;

(* Retrieves the set ascociated with the variable or derived from the literal 
   @Returns a SET*)
let rec solve_lang = function
 | LangLiteral(lit) -> 		convert_literal_lang lit
 | LangVariable(var) -> 	lookup_lang var
 | Union (l1, l2) -> 		WordSet.union (solve_lang l1) (solve_lang l2)
 | Intersection (l1, l2) -> WordSet.inter (solve_lang l1) (solve_lang l2) 
 | Subtraction (l1, l2) -> 	WordSet.diff  (solve_lang l1) (solve_lang l2) 
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

let rec interpret (prog:program) =
	match prog with
	| Output (lang )-> (print_language (solve_lang lang)); 
	| LangDeclaration(var , lang) -> (print_string ("L Declaration of "^var))
	| WordDeclaration(var , wrd) -> (print_string ("W Declaration of "^var))
	| IntDeclaration(var , num) -> (print_string ("I Declaration of "^var))
	| Statement( lang )-> print_string ""; 
	| Statements ( head, tail ) -> interpret head; interpret tail;
;;

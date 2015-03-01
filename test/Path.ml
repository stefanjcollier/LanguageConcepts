(* File Path.ml *)

type word = 
	  | Word of string
	  | MoreWords of (word * word)
	  ;;

let rec print_morewords res = 
	match res with
		| Word (w1) -> print_string ("<Word> "^w1^"\n") 
		| MoreWords( w , mw ) -> print_morewords w; print_morewords mw; 
;;

type language =
 | EmptySet  
 | Cons of (string * language)
;;


type generic = 
 | GenW of string
 | GenL of language
 | GenMulti of (generic * generic)
;;

let print_language lang =
	let rec aux inp = 
		match inp with
	 	| Cons ( s , l) -> s ^", " ^ (aux l)
	 	| EmptySet -> "" 
	 in
 	"<lang> {"^aux lang^"}"
 ;;

let rec print_generic res =
	match res with
	| GenL (l) -> print_string (print_language l)
	| GenW (w) -> print_string ("<word> "^w)
	| GenMulti (g1 , g2) -> print_generic g1 ; print_generic g2;
;;




(* File Path.ml *)

type results = 
	  | Word of string
	  | MoreWords of (results * results)
	  ;;

let rec print_RESULTS res = 
	match res with
		| Word (w1) -> print_string ("<Word> "^w1^"\n") 
		| MoreWords( w , mw ) -> print_RESULTS w; print_RESULTS mw; 
;;
(* File calc.ml *)
type results = 
	  | Word of string
	  | MoreWords of (results * results)
	  ;;

let rec print_RESULTS res = 
	match res with
		| Word (w1) -> print_string ("<Word> "^w1^"\n") 
		| MoreWords( w , mw ) -> print_RESULTS w; print_RESULTS mw; 
;;

let _ =
try
  let lexbuf = Lexing.from_channel stdin in
   while true do
     let result = Parser.main Lexer.token lexbuf in
       print_RESULTS result; print_newline(); flush stdout
   done
with Lexer.Eof ->
print_string "Adios Mother fucker" ;
	exit 0



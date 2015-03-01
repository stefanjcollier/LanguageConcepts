(* File calc.ml *)
(*let print_RESULtS res = 
	let rec aux res = 
		match res with
		| (Word w1) -> w1 
		| MoreWords( (Word w1), (MoreWords mw) ) -> w1 ^ "\n" ^ (aux mw)
	in 
	print_string aux res
;;
*)

let _ =
try
  let lexbuf = Lexing.from_channel stdin in
   while true do
     let result = Parser.main Lexer.token lexbuf in
       print_string result; print_newline(); flush stdout
   done
with Lexer.Eof ->
print_string "Adios Mother fucker" ;
	exit 0



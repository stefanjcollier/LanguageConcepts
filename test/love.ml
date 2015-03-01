(* File love.ml *)
(*open Path*)

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



(* File love.ml *)
open Path

let _ =
try
  let lexbuf = Lexing.from_channel stdin in
     let result = Parser.main Lexer.token lexbuf in
       interpret result; print_newline(); flush stdout
with Lexer.Eof ->
print_string "Adios Mother fucker" ;
	exit 0


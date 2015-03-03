open Path

let _ = 
try 
let progBuf = Lexing.from_channel (open_in Sys.argv.(1)) in
let inpBuf = Lexing.from_channel (open_in Sys.argv.(2)) in
let program = Parser.main Lexer.token progBuf in
let inp = Parser.main Lexer.token inpBuf in
	main program input; 
	print_newline(); 
	flush stdout;
with Lexer.Eof ->
print_string "Adios Mother fucker" ;
	exit 0


open Path

let _ = 
	try 
		let progBuf = Lexing.from_channel (open_in Sys.argv.(1)) in
		let prog = (Parser.main Lexer.token progBuf) and
		inpBuf = Lexing.from_channel stdin in
		let inp = (Parser.main Lexer.token inpBuf) in
			main prog inp; 
			print_newline(); 
			flush stdout
	with Lexer.Eof ->
		print_string "Adios Mother fucker" ;
			exit 0


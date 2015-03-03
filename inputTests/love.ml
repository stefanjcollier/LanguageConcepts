open Path

let _ = 
	try 
		let progBuf = Lexing.from_channel (open_in Sys.argv.(1)) in
		let prog = (Parser.main Lexer.token progBuf) and
		inpBuf = Lexing.from_channel stdin in
		let inp = (Inputparser.main Inputlexer.token inpBuf) in
			main prog inp; 
			print_newline(); 
			flush stdout
	with Lexer.Eof ->
		print_string "Our love is over now, Goodbye we're through..." ;
			exit 0
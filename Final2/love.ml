open Path

let _ = 
	try 
		let progBuf = Lexing.from_channel (open_in Sys.argv.(1)) in
		let prog = (Parser.main Lexer.token progBuf) and
		inpBuf = Lexing.from_channel stdin in
		let inp = (Inputparser.main Inputlexer.token inpBuf) in
			main prog inp; 
			flush stdout
	with 
	| Lexer.Eof ->
			exit 0;

	| Failure(prob) ->
		if prob = "lexing: empty token"
		then 
			prerr_string "There is an unrecognised symbol used in the program or input"
		else
			prerr_string prob
			;


	
	| Path.Unrecognised_Language_identifier(text) ->
		prerr_string (text^"\n")

	| Path.Unrecognised_Word_identifier(text) ->
		prerr_string (text^"\n")

	| Path.Incorrect_Input_Structure(num) ->
		prerr_string ("The delimeter "^(string_of_int num)^" in the input file is < 1, it must be >= 1\n");
		exit 0

	| Path.Invalid_concatination(wrd,lang) ->
		prerr_string ("You cannot concatonate a word ("^wrd^") and a language "^(language_of_string lang)^"\n")

	| Path.Invalid_declaration(msg) ->
		prerr_string (msg^"\n")

	| Parsing.Parse_error -> 
		prerr_string ("Unrecognised program structure \n")	

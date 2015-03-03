let run =
	storeInput;
	try
	let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in
	(*try *)
	while true do
		let result = (Parser.main Lexer.token lexbuf) in
		entryPoint := result;
		for i = 0 to !streamLength-1 do
			streamBinding := VariableBinding.empty;
			(bindStreamElements 0 inputStream);
			flush stdout;
			recursivePath !entryPoint;
	done;
		done
		with Lexer.Eof ->
			print_int (List.length !outputStream);
			print_string "\n";
			printList (List.rev !outputStream);
			print_string "\n"; print_string "\n";
			exit 0

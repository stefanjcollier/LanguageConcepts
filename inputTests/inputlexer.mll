{
	open Inputparser
	exception Eof
}

rule token = parse
 | [' ' '\t']  	{ token lexbuf }
 | ['\n']		{ EOL }
 | "{}" 		{ EMPTY_SET }
 | '{'			{ LCURL }
 | '}' 			{ RCURL }
 | ',' 			{ COMMA }

 | ['a'-'z' ':']+ as wrd { WORD(wrd) }
 | ['0'-'9']+ as vl { INT(int_of_string vl) } 
 | eof { raise Eof }
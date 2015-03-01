
{
	open Parser
	exception Eof
}

(* Added EOL *)

rule token = parse
 [' ' '\t' ]  { token lexbuf }
| ['\n'] { EOL }
| "Happy Ending" { EXP_END }
| '^' { CONCAT }
| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| eof { raise Eof }

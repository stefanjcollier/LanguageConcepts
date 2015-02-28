
{
	open Parser
	exception Eof
}

rule token = parse
 [' ' '\t' ]  { token lexbuf }
| "Happy Ending" { EXP_END }
| '^' { CONCAT }
| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| eof { raise Eof }
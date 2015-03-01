
{
	open Parser
	exception Eof
}


rule token = parse
 [' ' '\t']  { token lexbuf }
| ['\n']  { EOL }
| "Happy Ending" | "<3" { EXP_END }
| '^' { CONCAT }
| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| "</3" { PROG_END }
| eof { raise Eof }

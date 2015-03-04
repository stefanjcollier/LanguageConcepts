
{
	open Parser
	exception Eof
}


rule token = parse
 [' ' '\t']  { token lexbuf }
| ['\n']  { EOL }
| "Happy Ending" | "<3" { EXP_END }

| "{}" { EMPTY_SET }
| '{' { LCURL }
| '}' { RCURL}
| ',' { COMMA }

| "\\/" { UNION }
| "/\\" { INTERSECT }
| "\\"	{ SUBTRACT }

| '=' { EQUALS }
| '^' { CONCAT }
| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| '#'['A'-'Z' 'a'-'z' '0'-'9']+ as var { INT_VAR(var) }
| '"'['A'-'Z' 'a'-'z' '0'-'9']+ as var { WORD_VAR(var) }
| '@'['A'-'Z' 'a'-'z' '0'-'9']+ as var { LANG_VAR(var) }

| "</3" { PROG_END }
| "Out" { OUTPUT }

| eof { raise Eof }


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
| '\"'['a'-'z' 'A'-'Z' '0'-'9' ' ' '+' '*' ')' '(' '?' '|' '[' ']' '*' '^' '}' '{' ',' '\\' '!' '$' '-' ':']+'\"' as reg { REGEX(reg) }

| '=' { EQUALS }
| '^' { CONCAT }
| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| ['0'-'9']+ as vl { INT(int_of_string vl) }
| '#'['A'-'Z' 'a'-'z' '0'-'9']+ as var { INT_VAR(var) }
| '"'['A'-'Z' 'a'-'z' '0'-'9']+ as var { WORD_VAR(var) }
| '@'['A'-'Z' 'a'-'z' '0'-'9']+ as var { LANG_VAR(var) }

| "</3" { PROG_END }
| "Out" { OUTPUT }

| eof { raise Eof }

(* File Lexer.mll *)

{

exception Eof
}

(* Brackets ? *)
rule token = parse
| [' ' '\t' ] {token lexbuf}
| "Happy Ending" | "<3" { EXPR_END }
| '{' { LCURL }
| '}' { RCURL}

| "{}" { EMPTY_SET }

| "\\/" { UNION }
| "/\\" { INTERSECT }
| '\\' { SUBTRACT }

| ',' { COMMA }
| '^' { CONCAT }

| ['a'-'z' ':']+ as wrd { WORD(wrd) }
| ['0'-'9']+ as val { INT(val) }
| '#'['A'-'Z' 'a'-'z' '0'-'9']+ as var { INT_VAR(var) }
| '"'['A'-'Z' 'a'-'z' '0'-'9']+ as var { WORD_VAR(var) }
| '@'['A'-'Z' 'a'-'z' '0'-'9']+ as var { LANG_VAR(var) }

| "Make" { DEC }
| '=' { EQUALS }
| "Out" { OUTPUT }
| "First" { FIRST }
| "Last" { LAST }
| eof { raise Eof }

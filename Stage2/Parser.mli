type token =
  | WORD of (string)
  | EXP_END
  | EOL
  | PROG_END
  | LCURL
  | RCURL
  | EMPTY_SET
  | COMMA
  | CONCAT
  | UNION
  | INTERSECT
  | SUBTRACT
  | OUTPUT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Path.program

type token =
  | WORD of (string)
  | WORD_VAR of (string)
  | LANG_VAR of (string)
  | EXP_END
  | EOL
  | PROG_END
  | LCURL
  | RCURL
  | EMPTY_SET
  | COMMA
  | EQUALS
  | REGEX of (string)
  | CONCAT
  | STAR
  | UNION
  | INTERSECT
  | SUBTRACT
  | OUTPUT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Path.program

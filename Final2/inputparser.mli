type token =
  | INT of (int)
  | WORD of (string)
  | LCURL
  | RCURL
  | EMPTY_SET
  | COMMA
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Path.input

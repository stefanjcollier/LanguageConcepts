type token =
  | WORD of (string)
  | CONCAT
  | EXP_END

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string

type token =
  | WORD of (string)
  | CONCAT
  | EXP_END
  | EOL
  | PROG_END

val main1 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> love.results

# 2 "lexer.mll"
 
	open Parser
	exception Eof

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\236\255\007\000\078\000\111\000\242\255\243\255\244\255\
    \209\000\001\000\001\000\249\255\250\255\011\000\002\000\040\000\
    \254\255\255\255\026\000\027\000\019\000\001\000\000\000\031\000\
    \042\000\065\000\061\000\069\000\253\255\000\000\238\255\252\255\
    \248\255\247\255\047\001\141\001\245\255\219\001\057\000\237\255\
    ";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\014\000\255\255\255\255\255\255\
    \255\255\255\255\009\000\255\255\255\255\004\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\015\000\255\255\016\000\255\255\255\255\
    ";
  Lexing.lex_default = 
   "\255\255\000\000\255\255\255\255\255\255\000\000\000\000\000\000\
    \255\255\255\255\255\255\000\000\000\000\255\255\255\255\255\255\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\255\255\000\000\000\000\
    \000\000\000\000\255\255\255\255\000\000\255\255\255\255\000\000\
    ";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\017\000\016\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \017\000\022\000\008\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\005\000\000\000\011\000\000\000\000\000\009\000\
    \032\000\029\000\000\000\030\000\000\000\028\000\000\000\000\000\
    \000\000\000\000\004\000\000\000\014\000\007\000\000\000\000\000\
    \003\000\000\000\000\000\000\000\000\000\023\000\000\000\000\000\
    \015\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\010\000\033\000\006\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\013\000\038\000\012\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \031\000\018\000\019\000\020\000\021\000\024\000\025\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\004\000\026\000\027\000\028\000\039\000\000\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\034\000\034\000\000\000\000\000\034\000\000\000\000\000\
    \000\000\034\000\034\000\034\000\034\000\034\000\034\000\000\000\
    \001\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\034\000\000\000\000\000\000\000\000\000\
    \034\000\000\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\034\000\034\000\034\000\034\000\
    \000\000\000\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\034\000\034\000\034\000\034\000\
    \034\000\036\000\000\000\034\000\000\000\000\000\000\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\000\000\000\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\000\000\000\000\000\000\000\000\034\000\000\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\000\000\000\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\036\000\
    \000\000\034\000\000\000\000\000\000\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\000\000\000\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\034\000\
    \000\000\000\000\000\000\000\000\034\000\000\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \034\000\034\000\034\000\034\000\000\000\000\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \034\000\034\000\034\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\021\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\255\255\000\000\255\255\255\255\000\000\
    \010\000\014\000\255\255\029\000\255\255\014\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\000\000\000\000\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\022\000\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\009\000\000\000\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\002\000\000\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \013\000\015\000\018\000\019\000\020\000\023\000\024\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\004\000\025\000\026\000\027\000\038\000\255\255\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\008\000\008\000\255\255\255\255\008\000\255\255\255\255\
    \255\255\008\000\008\000\008\000\008\000\008\000\008\000\255\255\
    \000\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\255\255\255\255\255\255\255\255\
    \008\000\255\255\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \255\255\255\255\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
    \008\000\008\000\008\000\008\000\008\000\008\000\008\000\034\000\
    \034\000\034\000\255\255\034\000\255\255\255\255\255\255\034\000\
    \034\000\034\000\034\000\034\000\034\000\255\255\255\255\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\255\255\255\255\255\255\255\255\034\000\255\255\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\255\255\255\255\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\035\000\035\000\035\000\
    \255\255\035\000\255\255\255\255\255\255\035\000\035\000\035\000\
    \035\000\035\000\035\000\255\255\255\255\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \255\255\255\255\255\255\255\255\035\000\255\255\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\255\255\255\255\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
    \035\000\035\000\035\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 9 "lexer.mll"
             ( token lexbuf )
# 237 "lexer.ml"

  | 1 ->
# 10 "lexer.mll"
          ( EOL )
# 242 "lexer.ml"

  | 2 ->
# 11 "lexer.mll"
                        ( EXP_END )
# 247 "lexer.ml"

  | 3 ->
# 13 "lexer.mll"
       ( EMPTY_SET )
# 252 "lexer.ml"

  | 4 ->
# 14 "lexer.mll"
      ( LCURL )
# 257 "lexer.ml"

  | 5 ->
# 15 "lexer.mll"
      ( RCURL)
# 262 "lexer.ml"

  | 6 ->
# 16 "lexer.mll"
      ( COMMA )
# 267 "lexer.ml"

  | 7 ->
# 18 "lexer.mll"
        ( UNION )
# 272 "lexer.ml"

  | 8 ->
# 19 "lexer.mll"
        ( INTERSECT )
# 277 "lexer.ml"

  | 9 ->
# 20 "lexer.mll"
       ( SUBTRACT )
# 282 "lexer.ml"

  | 10 ->
let
# 21 "lexer.mll"
                                                                                                                     reg
# 288 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 21 "lexer.mll"
                                                                                                                         ( REGEX(reg) )
# 292 "lexer.ml"

  | 11 ->
# 23 "lexer.mll"
      ( EQUALS )
# 297 "lexer.ml"

  | 12 ->
# 24 "lexer.mll"
      ( CONCAT )
# 302 "lexer.ml"

  | 13 ->
# 25 "lexer.mll"
      ( STAR )
# 307 "lexer.ml"

  | 14 ->
let
# 26 "lexer.mll"
                    wrd
# 313 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 26 "lexer.mll"
                        ( WORD(wrd) )
# 317 "lexer.ml"

  | 15 ->
let
# 27 "lexer.mll"
                                   var
# 323 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 27 "lexer.mll"
                                       ( WORD_VAR(var) )
# 327 "lexer.ml"

  | 16 ->
let
# 28 "lexer.mll"
                                   var
# 333 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 28 "lexer.mll"
                                       ( LANG_VAR(var) )
# 337 "lexer.ml"

  | 17 ->
# 30 "lexer.mll"
        ( PROG_END )
# 342 "lexer.ml"

  | 18 ->
# 31 "lexer.mll"
        ( OUTPUT )
# 347 "lexer.ml"

  | 19 ->
# 33 "lexer.mll"
      ( raise Eof )
# 352 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;


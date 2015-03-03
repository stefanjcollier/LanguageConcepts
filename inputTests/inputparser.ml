type token =
  | INT of (int)
  | WORD of (string)
  | LCURL
  | RCURL
  | EMPTY_SET
  | COMMA
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "inputparser.mly"
	open Path

# 16 "inputparser.ml"
let yytransl_const = [|
  259 (* LCURL *);
  260 (* RCURL *);
  261 (* EMPTY_SET *);
  262 (* COMMA *);
  263 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* WORD *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\004\000\004\000\005\000\000\000"

let yylen = "\002\000\
\001\000\003\000\001\000\003\000\001\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\000\000\008\000\001\000\000\000\007\000\
\000\000\000\000\000\000\004\000\000\000\002\000\006\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\009\000\010\000"

let yysindex = "\002\000\
\255\254\000\000\000\000\002\255\000\000\000\000\250\254\000\000\
\001\255\000\255\255\254\000\000\002\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\003\255\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\253\255\000\000\252\255\000\000"

let yytablesize = 9
let yytable = "\003\000\
\011\000\004\000\001\000\008\000\012\000\013\000\005\000\014\000\
\015\000"

let yycheck = "\001\001\
\007\001\003\001\001\000\002\001\004\001\006\001\004\001\011\000\
\013\000"

let yynames_const = "\
  LCURL\000\
  RCURL\000\
  EMPTY_SET\000\
  COMMA\000\
  EOL\000\
  "

let yynames_block = "\
  INT\000\
  WORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'inp) in
    Obj.repr(
# 15 "inputparser.mly"
           ( _1 )
# 83 "inputparser.ml"
               : Path.input))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'lang_literal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'inp) in
    Obj.repr(
# 19 "inputparser.mly"
                        ( MultiLangauges(_1, _3))
# 91 "inputparser.ml"
               : 'inp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 20 "inputparser.mly"
            ( Integer(_1) )
# 98 "inputparser.ml"
               : 'inp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'lang_body) in
    Obj.repr(
# 24 "inputparser.mly"
                         ( _2 )
# 105 "inputparser.ml"
               : 'lang_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 27 "inputparser.mly"
                 ( Cons (_1, Empty_Set))
# 112 "inputparser.ml"
               : 'lang_body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'lang_body) in
    Obj.repr(
# 28 "inputparser.mly"
                            ( Cons (_1, _3))
# 120 "inputparser.ml"
               : 'lang_body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 32 "inputparser.mly"
        ( WordLiteral (_1) )
# 127 "inputparser.ml"
               : 'wordExpr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Path.input)

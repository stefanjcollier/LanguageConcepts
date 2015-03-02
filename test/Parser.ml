type token =
  | WORD of (string)
  | CONCAT
  | EXP_END
  | EOL
  | PROG_END
  | LCURL
  | RCURL
  | EMPTY_SET
  | COMMA
  | UNION
  | OUTPUT

open Parsing;;
let _ = parse_error;;
# 3 "Parser.mly"
	open Path
# 19 "Parser.ml"
let yytransl_const = [|
  258 (* CONCAT *);
  259 (* EXP_END *);
  260 (* EOL *);
  261 (* PROG_END *);
  262 (* LCURL *);
  263 (* RCURL *);
  264 (* EMPTY_SET *);
  265 (* COMMA *);
  266 (* UNION *);
  267 (* OUTPUT *);
    0|]

let yytransl_block = [|
  257 (* WORD *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\003\000\004\000\
\004\000\004\000\006\000\006\000\005\000\005\000\000\000"

let yylen = "\002\000\
\003\000\003\000\004\000\003\000\001\000\001\000\002\000\003\000\
\001\000\003\000\003\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\013\000\000\000\009\000\000\000\015\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\008\000\001\000\000\000\004\000\010\000\
\014\000\011\000\003\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\010\000\011\000\013\000"

let yysindex = "\003\000\
\010\255\000\000\000\000\018\255\000\000\255\254\000\000\015\255\
\019\255\014\255\023\255\000\255\020\255\014\255\022\255\002\255\
\255\254\018\255\018\255\000\000\000\000\010\255\000\000\000\000\
\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\025\255\026\255\024\255\000\000\027\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\028\255\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\001\000\000\000\251\255\252\255\013\000"

let yytablesize = 33
let yytable = "\012\000\
\014\000\018\000\003\000\001\000\004\000\022\000\005\000\004\000\
\019\000\005\000\003\000\024\000\006\000\025\000\012\000\004\000\
\023\000\005\000\003\000\015\000\006\000\016\000\027\000\017\000\
\018\000\021\000\020\000\005\000\006\000\007\000\012\000\026\000\
\002\000"

let yycheck = "\004\000\
\006\000\002\001\001\001\001\000\006\001\004\001\008\001\006\001\
\009\001\008\001\001\001\017\000\011\001\018\000\019\000\006\001\
\016\000\008\001\001\001\005\001\011\001\003\001\022\000\010\001\
\002\001\004\001\007\001\003\001\003\001\003\001\007\001\019\000\
\005\001"

let yynames_const = "\
  CONCAT\000\
  EXP_END\000\
  EOL\000\
  PROG_END\000\
  LCURL\000\
  RCURL\000\
  EMPTY_SET\000\
  COMMA\000\
  UNION\000\
  OUTPUT\000\
  "

let yynames_block = "\
  WORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'prog) in
    Obj.repr(
# 16 "Parser.mly"
                        ( _1 )
# 108 "Parser.ml"
               : Path.generic))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 20 "Parser.mly"
                   ( _1 )
# 115 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 21 "Parser.mly"
                        ( GenMulti( _1, _4) )
# 123 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 22 "Parser.mly"
                    ( GenMulti( _1, _3) )
# 131 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 26 "Parser.mly"
                 ( GenL(_1) )
# 138 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 27 "Parser.mly"
              ( GenW(_1) )
# 145 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 28 "Parser.mly"
                      ( Output(_2) )
# 152 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'langbody) in
    Obj.repr(
# 32 "Parser.mly"
                          ( _2 )
# 159 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "Parser.mly"
                 ( EmptySet )
# 165 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 34 "Parser.mly"
                                   ( Union(_1, _3) )
# 173 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'langbody) in
    Obj.repr(
# 38 "Parser.mly"
                           ( Cons ( _1 , _3))
# 181 "Parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 39 "Parser.mly"
                ( Cons ( _1, EmptySet))
# 188 "Parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 42 "Parser.mly"
       ( _1 )
# 195 "Parser.ml"
               : 'wordExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 43 "Parser.mly"
                           ( _1^_3 )
# 203 "Parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Path.generic)

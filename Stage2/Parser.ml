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

open Parsing;;
let _ = parse_error;;
# 3 "Parser.mly"
	open Path
# 21 "Parser.ml"
let yytransl_const = [|
  258 (* EXP_END *);
  259 (* EOL *);
  260 (* PROG_END *);
  261 (* LCURL *);
  262 (* RCURL *);
  263 (* EMPTY_SET *);
  264 (* COMMA *);
  265 (* CONCAT *);
  266 (* UNION *);
  267 (* INTERSECT *);
  268 (* SUBTRACT *);
  269 (* OUTPUT *);
    0|]

let yytransl_block = [|
  257 (* WORD *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\003\000\004\000\
\004\000\004\000\004\000\004\000\006\000\006\000\005\000\005\000\
\000\000"

let yylen = "\002\000\
\003\000\003\000\004\000\003\000\001\000\001\000\002\000\003\000\
\001\000\003\000\003\000\003\000\001\000\003\000\001\000\003\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\015\000\000\000\009\000\000\000\017\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\008\000\001\000\000\000\
\004\000\010\000\011\000\012\000\016\000\014\000\003\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\010\000\011\000\013\000"

let yysindex = "\007\000\
\017\255\000\000\000\000\010\255\000\000\255\254\000\000\019\255\
\023\255\009\255\020\255\018\255\022\255\009\255\028\255\002\255\
\255\254\255\254\255\254\010\255\010\255\000\000\000\000\017\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\030\255\031\255\029\255\000\000\032\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\033\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\242\255\000\000\251\255\252\255\015\000"

let yytablesize = 37
let yytable = "\012\000\
\014\000\025\000\003\000\004\000\024\000\005\000\004\000\001\000\
\005\000\031\000\003\000\026\000\027\000\028\000\006\000\029\000\
\012\000\003\000\017\000\018\000\019\000\004\000\015\000\005\000\
\016\000\021\000\020\000\022\000\020\000\006\000\023\000\005\000\
\006\000\007\000\013\000\030\000\002\000"

let yycheck = "\004\000\
\006\000\016\000\001\001\005\001\003\001\007\001\005\001\001\000\
\007\001\024\000\001\001\017\000\018\000\019\000\013\001\020\000\
\021\000\001\001\010\001\011\001\012\001\005\001\004\001\007\001\
\002\001\008\001\009\001\006\001\009\001\013\001\003\001\002\001\
\002\001\002\001\006\001\021\000\004\001"

let yynames_const = "\
  EXP_END\000\
  EOL\000\
  PROG_END\000\
  LCURL\000\
  RCURL\000\
  EMPTY_SET\000\
  COMMA\000\
  CONCAT\000\
  UNION\000\
  INTERSECT\000\
  SUBTRACT\000\
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
# 17 "Parser.mly"
                        ( _1 )
# 116 "Parser.ml"
               : Path.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 21 "Parser.mly"
                    ( _1 )
# 123 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 22 "Parser.mly"
                         ( Statements( _1, _4) )
# 131 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 23 "Parser.mly"
                     ( Statements( _1, _3) )
# 139 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 27 "Parser.mly"
                  ( Statement(_1) )
# 146 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 28 "Parser.mly"
               ( WStatement(_1) )
# 153 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 29 "Parser.mly"
                       ( Output(_2) )
# 160 "Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'langbody) in
    Obj.repr(
# 33 "Parser.mly"
                          ( LangLiteral(_2) )
# 167 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "Parser.mly"
                 ( LangLiteral(Empty_Set) )
# 173 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 35 "Parser.mly"
                                   ( Union(_1, _3) )
# 181 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 36 "Parser.mly"
                                       ( Union(_1, _3) )
# 189 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 37 "Parser.mly"
                                      ( Union(_1, _3) )
# 197 "Parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 41 "Parser.mly"
                ( Cons (_1, Empty_Set))
# 204 "Parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'langbody) in
    Obj.repr(
# 42 "Parser.mly"
                           ( Cons (_1, _3))
# 212 "Parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "Parser.mly"
        ( _1 )
# 219 "Parser.ml"
               : 'wordExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 47 "Parser.mly"
                            ( _1^_3 )
# 227 "Parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Path.program)

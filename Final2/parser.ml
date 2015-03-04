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

open Parsing;;
let _ = parse_error;;
# 3 "parser.mly"
	open Path

	

# 29 "parser.ml"
let yytransl_const = [|
  260 (* EXP_END *);
  261 (* EOL *);
  262 (* PROG_END *);
  263 (* LCURL *);
  264 (* RCURL *);
  265 (* EMPTY_SET *);
  266 (* COMMA *);
  267 (* EQUALS *);
  269 (* CONCAT *);
  270 (* STAR *);
  271 (* UNION *);
  272 (* INTERSECT *);
  273 (* SUBTRACT *);
  274 (* OUTPUT *);
    0|]

let yytransl_block = [|
  257 (* WORD *);
  258 (* WORD_VAR *);
  259 (* LANG_VAR *);
  268 (* REGEX *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\003\000\006\000\006\000\006\000\006\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\007\000\007\000\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\003\000\003\000\004\000\003\000\001\000\001\000\002\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\002\000\
\002\000\001\000\003\000\001\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\028\000\000\000\000\000\000\000\016\000\000\000\
\031\000\000\000\000\000\000\000\000\000\008\000\000\000\000\000\
\030\000\000\000\000\000\017\000\000\000\000\000\000\000\000\000\
\000\000\024\000\000\000\000\000\000\000\000\000\025\000\000\000\
\000\000\000\000\000\000\000\000\000\000\015\000\000\000\001\000\
\000\000\004\000\000\000\000\000\000\000\022\000\000\000\023\000\
\000\000\000\000\000\000\027\000\029\000\003\000"

let yydgoto = "\002\000\
\009\000\010\000\011\000\012\000\022\000\014\000\019\000"

let yysindex = "\001\000\
\046\255\000\000\000\000\249\254\016\255\011\255\000\000\112\255\
\000\000\002\255\030\255\063\255\008\255\000\000\112\255\112\255\
\000\000\252\254\044\255\000\000\109\255\012\255\039\255\036\255\
\112\255\000\000\112\255\088\255\100\255\112\255\000\000\109\255\
\012\255\109\255\012\255\011\255\011\255\000\000\112\255\000\000\
\046\255\000\000\048\255\012\255\037\255\000\000\037\255\000\000\
\037\255\109\255\049\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\003\255\052\255\000\000\000\000\000\000\
\000\000\000\000\000\000\056\255\077\255\000\000\000\000\000\000\
\000\000\084\255\000\000\000\000\081\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\089\255\
\090\255\092\255\094\255\000\000\000\000\000\000\000\000\000\000\
\093\255\000\000\057\255\101\255\042\255\000\000\067\255\000\000\
\071\255\102\255\253\254\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\235\255\000\000\003\000\255\255\000\000\068\000"

let yytablesize = 126
let yytable = "\013\000\
\029\000\001\000\042\000\015\000\018\000\036\000\030\000\023\000\
\037\000\029\000\021\000\003\000\017\000\033\000\035\000\030\000\
\030\000\032\000\034\000\054\000\030\000\031\000\013\000\044\000\
\037\000\031\000\016\000\043\000\051\000\045\000\047\000\049\000\
\050\000\024\000\018\000\053\000\003\000\004\000\005\000\013\000\
\041\000\043\000\006\000\040\000\007\000\018\000\003\000\004\000\
\005\000\039\000\026\000\038\000\006\000\008\000\007\000\017\000\
\018\000\018\000\018\000\005\000\021\000\026\000\031\000\008\000\
\017\000\017\000\017\000\017\000\017\000\021\000\019\000\021\000\
\021\000\021\000\020\000\025\000\026\000\027\000\028\000\029\000\
\006\000\019\000\019\000\019\000\007\000\020\000\020\000\020\000\
\003\000\017\000\020\000\026\000\014\000\012\000\006\000\011\000\
\007\000\013\000\002\000\046\000\003\000\017\000\020\000\052\000\
\010\000\009\000\006\000\000\000\007\000\000\000\000\000\048\000\
\003\000\017\000\020\000\000\000\000\000\000\000\006\000\000\000\
\007\000\039\000\026\000\027\000\028\000\029\000"

let yycheck = "\001\000\
\004\001\001\000\024\000\011\001\006\000\010\001\004\001\006\001\
\013\001\013\001\008\000\001\001\002\001\015\000\016\000\013\001\
\014\001\015\000\016\000\041\000\013\001\014\001\024\000\025\000\
\013\001\014\001\011\001\025\000\030\000\027\000\028\000\029\000\
\030\000\004\001\036\000\037\000\001\001\002\001\003\001\041\000\
\005\001\039\000\007\001\005\001\009\001\004\001\001\001\002\001\
\003\001\013\001\014\001\008\001\007\001\018\001\009\001\004\001\
\015\001\016\001\017\001\004\001\004\001\014\001\014\001\018\001\
\013\001\014\001\015\001\016\001\017\001\013\001\004\001\015\001\
\016\001\017\001\004\001\013\001\014\001\015\001\016\001\017\001\
\004\001\015\001\016\001\017\001\004\001\015\001\016\001\017\001\
\001\001\002\001\003\001\008\001\004\001\004\001\007\001\004\001\
\009\001\004\001\006\001\012\001\001\001\002\001\003\001\036\000\
\004\001\004\001\007\001\255\255\009\001\255\255\255\255\012\001\
\001\001\002\001\003\001\255\255\255\255\255\255\007\001\255\255\
\009\001\013\001\014\001\015\001\016\001\017\001"

let yynames_const = "\
  EXP_END\000\
  EOL\000\
  PROG_END\000\
  LCURL\000\
  RCURL\000\
  EMPTY_SET\000\
  COMMA\000\
  EQUALS\000\
  CONCAT\000\
  STAR\000\
  UNION\000\
  INTERSECT\000\
  SUBTRACT\000\
  OUTPUT\000\
  "

let yynames_block = "\
  WORD\000\
  WORD_VAR\000\
  LANG_VAR\000\
  REGEX\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'prog) in
    Obj.repr(
# 27 "parser.mly"
                        ( _1 )
# 167 "parser.ml"
               : Path.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                    ( _1 )
# 174 "parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 32 "parser.mly"
                         ( Statements( _1, _4) )
# 182 "parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 33 "parser.mly"
                     ( Statements( _1, _3) )
# 190 "parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 37 "parser.mly"
                  ( Statement(_1) )
# 197 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 38 "parser.mly"
               ( WStatement(_1) )
# 204 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 39 "parser.mly"
                       ( Output(_2) )
# 211 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'dec) in
    Obj.repr(
# 40 "parser.mly"
       (Declaration( _1 ))
# 218 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 41 "parser.mly"
                                ( raise (Path.Invalid_concatination(Path.solve_word(_1), _3)) )
# 226 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 42 "parser.mly"
                                ( raise (Path.Invalid_concatination(Path.solve_word(_3), _1)) )
# 234 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 46 "parser.mly"
                                ( LangDeclaration (_1, _3) )
# 242 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 47 "parser.mly"
                            ( WordDeclaration (_1, _3) )
# 250 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 48 "parser.mly"
                            ( raise (Path.Invalid_declaration("Language variable("^_1^") cannot store word")) )
# 258 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 49 "parser.mly"
                                (raise (Path.Invalid_declaration("Word variable("^_1^") cannot store language")) )
# 266 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'langbody) in
    Obj.repr(
# 53 "parser.mly"
                          ( LangLiteral(_2) )
# 273 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                 ( LangLiteral(Empty_Set) )
# 279 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 55 "parser.mly"
            ( LangVariable ( _1 ) )
# 286 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 56 "parser.mly"
                                   ( Union(_1, _3) )
# 294 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 57 "parser.mly"
                                       ( Intersection(_1, _3) )
# 302 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 58 "parser.mly"
                                      ( Subtraction(_1, _3) )
# 310 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'languageExpr) in
    Obj.repr(
# 59 "parser.mly"
                                    ( LangConcat(_1, _3) )
# 318 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 60 "parser.mly"
                                ( OnlyRegex (_1, _3) )
# 326 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'languageExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "parser.mly"
                               ( RemoveRegex (_1 , _3) )
# 334 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'languageExpr) in
    Obj.repr(
# 62 "parser.mly"
                     ( Star (_1) )
# 341 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'wordExpr) in
    Obj.repr(
# 63 "parser.mly"
                  ( Star(LangLiteral(Cons (_1, Empty_Set))))
# 348 "parser.ml"
               : 'languageExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 67 "parser.mly"
                ( Cons (_1, Empty_Set))
# 355 "parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'langbody) in
    Obj.repr(
# 68 "parser.mly"
                           ( Cons (_1, _3))
# 363 "parser.ml"
               : 'langbody))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 72 "parser.mly"
        ( WordLiteral (_1) )
# 370 "parser.ml"
               : 'wordExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 73 "parser.mly"
                            ( WordConcat(_1, _3) )
# 378 "parser.ml"
               : 'wordExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
            ( WordVarialbe (_1) )
# 385 "parser.ml"
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

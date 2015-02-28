type token =
  | WORD of (string)
  | CONCAT
  | EXP_END

open Parsing;;
let _ = parse_error;;
# 3 "parser.mly"
    let con x y = x^y
# 11 "parser.ml"
let yytransl_const = [|
  258 (* CONCAT *);
  259 (* EXP_END *);
    0|]

let yytransl_block = [|
  257 (* WORD *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\000\000"

let yylen = "\002\000\
\001\000\002\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\005\000\001\000\000\000\000\000\002\000\
\000\000"

let yydgoto = "\002\000\
\004\000\005\000\006\000"

let yysindex = "\001\000\
\002\255\000\000\000\000\000\000\000\000\254\254\002\255\000\000\
\003\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\255"

let yygindex = "\000\000\
\000\000\000\000\255\255"

let yytablesize = 6
let yytable = "\007\000\
\008\000\001\000\003\000\004\000\007\000\009\000"

let yycheck = "\002\001\
\003\001\001\000\001\001\003\001\002\001\007\000"

let yynames_const = "\
  CONCAT\000\
  EXP_END\000\
  "

let yynames_block = "\
  WORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 12 "parser.mly"
           ( _1 )
# 68 "parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 15 "parser.mly"
                   ( _1 )
# 75 "parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 18 "parser.mly"
           ( _1 )
# 82 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                   ( _1^_3 )
# 90 "parser.ml"
               : 'expr))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : string)

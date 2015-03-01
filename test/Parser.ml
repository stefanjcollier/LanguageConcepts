type token =
  | WORD of (string)
  | CONCAT
  | EXP_END
  | EOL
  | PROG_END

open Parsing;;
let _ = parse_error;;
# 3 "Parser.mly"
	type results = 
	  | Word of string
	  | MoreWords of (results * results)
	  ;;
;;


# 19 "Parser.ml"
let yytransl_const = [|
  258 (* CONCAT *);
  259 (* EXP_END *);
  260 (* EOL *);
  261 (* PROG_END *);
    0|]

let yytransl_block = [|
  257 (* WORD *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\000\000"

let yylen = "\002\000\
\003\000\003\000\004\000\003\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\005\000\007\000\000\000\000\000\000\000\000\000\
\000\000\001\000\006\000\000\000\004\000\003\000"

let yydgoto = "\002\000\
\004\000\005\000\006\000"

let yysindex = "\001\000\
\006\255\000\000\000\000\000\000\004\255\003\255\007\255\006\255\
\255\254\000\000\000\000\006\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\005\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\248\255\004\000"

let yytablesize = 12
let yytable = "\003\000\
\013\000\001\000\012\000\014\000\008\000\009\000\003\000\000\000\
\007\000\002\000\010\000\011\000"

let yycheck = "\001\001\
\009\000\001\000\004\001\012\000\002\001\003\001\001\001\255\255\
\005\001\005\001\004\001\008\000"

let yynames_const = "\
  CONCAT\000\
  EXP_END\000\
  EOL\000\
  PROG_END\000\
  "

let yynames_block = "\
  WORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'prog) in
    Obj.repr(
# 19 "Parser.mly"
                        ( _1 )
# 82 "Parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    Obj.repr(
# 23 "Parser.mly"
                       ( _1 )
# 89 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'wordExpr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 24 "Parser.mly"
                            ( _1 ^"\n" ^ _4 )
# 97 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 25 "Parser.mly"
                        ( _1 ^"\n" ^ _3 )
# 105 "Parser.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 28 "Parser.mly"
       ( _1 )
# 112 "Parser.ml"
               : 'wordExpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'wordExpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'wordExpr) in
    Obj.repr(
# 29 "Parser.mly"
                           ( _1^_3 )
# 120 "Parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : string)

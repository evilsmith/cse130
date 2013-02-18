type token =
  | Num of (int)
  | EOF
  | True
  | False
  | Id of (string)
  | LET
  | REC
  | EQ
  | IN
  | FUN
  | ARROW
  | IF
  | THEN
  | ELSE
  | PLUS
  | MINUS
  | MUL
  | DIV
  | LT
  | LE
  | NE
  | AND
  | OR

open Parsing;;
let _ = parse_error;;
# 2 "nanoParse.mly"
(* See this for a tutorial on ocamlyacc 
 * http://plus.kaist.ac.kr/~shoh/ocaml/ocamllex-ocamlyacc/ocamlyacc-tutorial/ *)
open Nano 
# 33 "nanoParse.ml"
let yytransl_const = [|
    0 (* EOF *);
  258 (* True *);
  259 (* False *);
  261 (* LET *);
  262 (* REC *);
  263 (* EQ *);
  264 (* IN *);
  265 (* FUN *);
  266 (* ARROW *);
  267 (* IF *);
  268 (* THEN *);
  269 (* ELSE *);
  270 (* PLUS *);
  271 (* MINUS *);
  272 (* MUL *);
  273 (* DIV *);
  274 (* LT *);
  275 (* LE *);
  276 (* NE *);
  277 (* AND *);
  278 (* OR *);
    0|]

let yytransl_block = [|
  257 (* Num *);
  260 (* Id *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\006\000\007\000\004\000\006\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\003\000\004\000\002\000\000\000\000\000\
\000\000\009\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\007\000\000\000\000\000\000\000\
\000\000\005\000\000\000\008\000\006\000"

let yydgoto = "\002\000\
\010\000"

let yysindex = "\001\000\
\018\255\000\000\000\000\000\000\000\000\000\000\253\254\000\255\
\018\255\000\000\254\254\003\255\002\255\001\255\018\255\008\255\
\018\255\018\255\009\255\018\255\000\000\011\255\018\255\017\255\
\018\255\000\000\018\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\247\255"

let yytablesize = 29
let yytable = "\014\000\
\011\000\001\000\012\000\013\000\015\000\019\000\016\000\021\000\
\022\000\000\000\024\000\017\000\018\000\026\000\020\000\028\000\
\023\000\029\000\003\000\004\000\005\000\006\000\007\000\025\000\
\027\000\000\000\008\000\000\000\009\000"

let yycheck = "\009\000\
\004\001\001\000\006\001\004\001\007\001\015\000\004\001\017\000\
\018\000\255\255\020\000\010\001\012\001\023\000\007\001\025\000\
\008\001\027\000\001\001\002\001\003\001\004\001\005\001\013\001\
\008\001\255\255\009\001\255\255\011\001"

let yynames_const = "\
  EOF\000\
  True\000\
  False\000\
  LET\000\
  REC\000\
  EQ\000\
  IN\000\
  FUN\000\
  ARROW\000\
  IF\000\
  THEN\000\
  ELSE\000\
  PLUS\000\
  MINUS\000\
  MUL\000\
  DIV\000\
  LT\000\
  LE\000\
  NE\000\
  AND\000\
  OR\000\
  "

let yynames_block = "\
  Num\000\
  Id\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 38 "nanoParse.mly"
                                ( Const _1 )
# 144 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 39 "nanoParse.mly"
         ( Var _1 )
# 151 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "nanoParse.mly"
            ( True )
# 157 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "nanoParse.mly"
             ( False )
# 163 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Nano.expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Nano.expr) in
    Obj.repr(
# 42 "nanoParse.mly"
                           ( Let (_2, _4, _6) )
# 172 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Nano.expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Nano.expr) in
    Obj.repr(
# 43 "nanoParse.mly"
                               ( Letrec (_3, _5, _7) )
# 181 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Nano.expr) in
    Obj.repr(
# 44 "nanoParse.mly"
                       ( Fun (_2, _4) )
# 189 "nanoParse.ml"
               : Nano.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : Nano.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Nano.expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Nano.expr) in
    Obj.repr(
# 45 "nanoParse.mly"
                               ( If (_2, _4, _6) )
# 198 "nanoParse.ml"
               : Nano.expr))
(* Entry exp *)
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
let exp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Nano.expr)

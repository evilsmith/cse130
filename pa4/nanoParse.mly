%{
(* See this for a tutorial on ocamlyacc 
 * http://plus.kaist.ac.kr/~shoh/ocaml/ocamllex-ocamlyacc/ocamlyacc-tutorial/ *)
open Nano 
%}

%token <int> Num
%token EOF
%token True
%token False
%token <string> Id
%token LET
%token REC
%token EQ
%token IN
%token FUN
%token ARROW
%token IF
%token THEN
%token ELSE

%token PLUS
%token MINUS
%token MUL
%token DIV
%token LT
%token LE
%token NE
%token AND
%token OR


%start exp 
%type <Nano.expr> exp

%%

exp: Num                        { Const $1 }
    | Id { Var $1 }
    | True  { True }
    | False  { False }
    | LET Id EQ exp IN exp { Let ($2, $4, $6) }
    | LET REC Id EQ exp IN exp { Letrec ($3, $5, $7) }
    | FUN Id ARROW exp { Fun ($2, $4) }
    | IF exp THEN exp ELSE exp { If ($2, $4, $6) }

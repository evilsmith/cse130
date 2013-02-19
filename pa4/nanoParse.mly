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

%token LPAREN
%token RPAREN

%token LBRAC
%token RBRAC
%token SEMI
%token COLONCOLON

%nonassoc LET FUN IF
%left OR
%left AND
%left EQ NE LT LE
%right COLONCOLON SEMI
%left PLUS MINUS
%left MUL DIV
%left APP


%start exp 
%type <Nano.expr> exp

%%

exp:
      LET Id EQ exp IN exp      { Let($2,$4,$6) }
    | LET REC Id EQ exp IN exp  { Letrec($3,$5,$7) }
    | FUN Id ARROW exp          { Fun($2,$4) }
    | IF exp THEN exp ELSE exp  { If($2,$4,$6) }
    | exp2                      { $1 }

exp2:
      exp2 OR exp3              { Bin($1,Or,$3) }
    | exp3                      { $1 }

exp3:
      exp3 AND exp4             { Bin($1,And,$3) }
    | exp4                      { $1 }

exp4:
      exp4 EQ exp5              { Bin($1,Eq,$3) }
    | exp4 NE exp5              { Bin($1,Ne,$3) }
    | exp4 LT exp5              { Bin($1,Lt,$3) }
    | exp4 LE exp5              { Bin($1,Le,$3) }
    | exp9                      { $1 }

exp9:
      exp5 COLONCOLON exp9      { Bin($1,Cons,$3) }
    | exp5 SEMI exp9            { Bin($1,Cons,$3) }
    | exp9 RBRAC                { Bin($1,Cons,NilExpr) }
    | LBRAC exp9 {$2}
    | exp5                      { $1 }

exp5:
      exp5 PLUS exp6            { Bin($1,Plus,$3) }
    | exp5 MINUS exp6           { Bin($1,Minus,$3) }
    | exp6                      { $1 }

exp6:
      exp6 MUL exp7             { Bin($1,Mul,$3)}
    | exp6 DIV exp7             { Bin($1,Div,$3)}
    | exp7                      { $1 }

exp7:
      exp7 exp8                 { App($1,$2) }
    | exp8                      { $1 }

exp8:
      Num                       { Const($1) }
    | Id                        { Var($1) }
    | True                      { True }
    | False                     { False }
    | LPAREN exp RPAREN         { $2 }
    | LBRAC RBRAC               { NilExpr }

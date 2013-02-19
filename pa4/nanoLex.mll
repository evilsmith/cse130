{
  open Nano        (* nano.ml *)
  open NanoParse   (* nanoParse.ml from nanoParse.mly *)
}

rule token = parse
    eof         { EOF }
  | [' ' '\t' '\n' '\r']    { token lexbuf }
  | "false"   { False }
  | "true"    { True }
  | "let"     { LET }
  | "rec"     { REC }
  | "="       { EQ }
  | "in"      { IN }
  | "fun"     { FUN }
  | "->"      { ARROW }
  | "if"      { IF }
  | "then"    { THEN }
  | "else"    { ELSE }

  | "+"       { PLUS }
  | "-"       { MINUS }
  | "*"       { MUL }
  | "/"       { DIV }
  | "<"       { LT }
  | "<="      { LE }
  | "!="      { NE }
  | "&&"      { AND }
  | "||"      { OR }

  | "("      { LPAREN }
  | ")"      { RPAREN }

  | "["      { LBRAC }
  | "]"      { RBRAC }
  | ";"      { SEMI }
  | "::"     { COLONCOLON }

  | ['0'-'9']+ as n { Num (int_of_string n) }
  | ['A'-'Z''a'-'z']['A'-'Z''a'-'z''0'-'9']* as x { Id x }
  | _           { raise (MLFailure ("Illegal Character '"^(Lexing.lexeme lexbuf)^"'")) }

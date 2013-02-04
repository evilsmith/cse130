(* CSE 130: Programming Assignment 3
 * misc.ml
 *)

(* For this assignment, you may use the following library functions:

   List.map
   List.fold_left
   List.fold_right
   List.split
   List.combine
   List.length
   List.append
   List.rev

   See http://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html for
   documentation.
*)



(* Do not change the skeleton code! The point of this assignment is to figure
 * out how the functions can be written this way (using fold). You may only
 * replace the   failwith "to be implemented"   part. *)



(*****************************************************************)
(******************* 1. Warm Up   ********************************)
(*****************************************************************)

(*
sqsum : int list -> int 
Squares each element in the list and returns the sum
*)
let sqsum xs = 
  let f a x = a + (x * x) in
  let base = 0 in
    List.fold_left f base xs


(*
pipe : ('a -> 'a) list -> ('a -> 'a)
Returns a function that executes each function in the list sequentially on the
input
*)
let pipe fs = 
  let f a x = fun x' -> x (a x') in
  let base = fun x -> x in
    List.fold_left f base fs


(*
sepConcat : string -> string list -> -> string
Concatenates the strings in the list into a string separated by sep
*)
let rec sepConcat sep sl = match sl with 
  | [] -> ""
  | h :: t -> 
      let f a x = a ^ sep ^ x in
      let base = h in
      let l = t in
        List.fold_left f base l


(*
stringOfList : ('a -> string) -> 'a list -> string
Return the string representation of the input list
*)
let stringOfList f l = "[" ^ sepConcat "; " (List.map f l) ^ "]"

(*****************************************************************)
(******************* 2. Big Numbers ******************************)
(*****************************************************************)

(*
clone : 'a -> int -> 'a list
Create a list containing n elements of x
*)
let rec clone x n = match n with
    | n when n > 0 -> x :: clone x (n - 1)
    | _ -> []


(*
padZero : int list -> int list -> int list * int list
Returns two lists filled with 0's at the beginning so they are of equal length
*)
let rec padZero l1 l2 =
    let n = abs (List.length l1 - List.length l2) in
    let zeroes = clone 0 n in
    if List.length l1 > List.length l2
    then l1, zeroes @ l2
    else zeroes @ l1, l2


(*
removeZero : int list -> int list
Removes zeros at the beinning of the list
*)
let rec removeZero l = match l with
    | h::t -> if h = 0 then removeZero t else l
    | _ -> []


(*
bigAdd : int list -> int list -> int list
Returns a list containing the sum of the two input lists
*)
let bigAdd l1 l2 = 
  let add (l1, l2) = 
    let f a x =
        let (x1, x2) = x in
        let (carry, acc) = a in
        let sum = x1 + x2 + carry in
        let digit = sum mod 10 in
        let carry = sum / 10 in
        let l = digit :: acc in
        carry, l
    in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry, res) = List.fold_left f base args in
      carry :: res
  in 
    removeZero (add (padZero l1 l2))

(*
mulByDigit : int -> int list -> int list
Returns the product of an integer and big int
*)
let rec mulByDigit i l = match l with
    | h::t -> h * i / 10 :: List.map (fun x -> if (i * x) < 10 then i * x
    else (i * x) - 10) l
    | _ -> []

(*
padZero : int list -> int list -> int list * int list
Returns two lists filled with 0's at the beginning so they are of equal length
*)
let bigMul l1 l2 = 
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args = failwith "to be implemented" in
  let (_, res) = List.fold_left f base args in
    res

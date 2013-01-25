(* CSE 130: Programming Assignment 1
 * misc.ml
 *)

(* sumList : int list -> int 
    returns the sume of the elements in the list
    e.g. (sumList [1;2;3;4] is 10
*) 

let rec sumList l = match l with
    [] -> 0
    | (h::t) -> h + sumList t


(* digitsOfInt : int -> int list 
    returns the list of digits of n in the order in which they appear in n
    e.g. (digitsOfInt 123) is [1;2;3]
 *)

let rec digitsOfInt n = match n with
    0 -> []
    | n -> digitsOfInt (n / 10) @ (n mod 10)::[]


(* digits : int -> int list
 * (digits n) is the list of digits of n in the order in which they appear
 * in n
 * e.g. (digits 31243) is [3,1,2,4,3]
 *      (digits (-23422) is [2,3,4,2,2]
 *)
 
let digits n = digitsOfInt (abs n)


(* From http://mathworld.wolfram.com/AdditivePersistence.html
 * Consider the process of taking a number, adding its digits, 
 * then adding the digits of the number derived from it, etc., 
 * until the remaining number has only one digit. 
 * The number of additions required to obtain a single digit from a number n 
 * is called the additive persistence of n, and the digit obtained is called 
 * the digital root of n.
 * For example, the sequence obtained from the starting number 9876 is (9876, 30, 3), so 
 * 9876 has an additive persistence of 2 and a digital root of 3.
 *)


(* ***** PROVIDE COMMENT BLOCKS FOR THE FOLLOWING FUNCTIONS ***** *)

(* additivePersistence : int -> int
   return the additive persistence of the input n
   e.g. (additivePersistence 9876) is 2
 *)

let rec additivePersistence n = match n with
    n when n < 10 -> 0
    | n -> let sum = sumList (digits n) in 1 + (additivePersistence sum)


(* digitalRoot : int -> int
   return the digitalRoot of the input n
   e.g. (digitalRoot 9876) is 3
 *)

let rec digitalRoot n = match n with
    n when n < 10 -> n
    | n -> let sum = sumList (digits n) in digitalRoot sum


(* listReverse: a list -> a list
    return the input list with the elements in reverse order
    e.g. (listReverse [1;2;3;4] is [4;3;2;1]
 *)

let rec listReverse l = match l with
    [] -> []
    | (h::t) -> (listReverse t) @ [h]


(* explode : string -> char list 
 * (explode s) is the list of characters in the string s in the order in 
 *   which they appear
 * e.g.  (explode "Hello") is ['H';'e';'l';'l';'o']
 *)
let explode s = 
  let rec _exp i = 
    if i >= String.length s then [] else (s.[i])::(_exp (i+1)) in
  _exp 0


(* listReverse: string -> bool
    returns true if the input string is a palindrome, false otherwise
    e.g. (palindrome "malay") is false
       . (palindrome "ababa") is true
 *)

let palindrome w = 
    let l = explode w in l = listReverse l


(************** Add Testing Code Here ***************)

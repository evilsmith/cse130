(* CSE 130: Programming Assignment 2
 * misc.ml
 *)

(* ***** DOCUMENT ALL FUNCTIONS YOU WRITE OR COMPLETE ***** *)

(*
assoc : int * string * (string * int) list -> int
Returns the value of the string if it is in the list, returns default otherwise
*)
let rec assoc (d,k,l) =
    match l with
        | [] -> d
        | (key, value)::t -> if key = k then value else assoc (d, k, t)

(*
removeDuplicates : int list * int list -> int list
Returns a copy of the list with the duplicates removed
*)
let removeDuplicates l = 
  let rec helper (seen,rest) = 
      match rest with 
        [] -> seen
      | h::t -> 
        let seen' = if List.mem h seen then seen else h::seen in
        let rest' = t in 
	  helper (seen',rest') 
  in
      List.rev (helper ([],l))


(*
wwhile : (int -> int * bool) * int -> int
Applies the function f on b until f ouputs false
*)
let rec wwhile (f,b) =
    let (result, flag) = f b in
        if flag then wwhile (f, result) else result

(*
fixpoint : (int -> int) * int -> int
Applies the function f on b until f(b) = b
*)
let fixpoint (f,b) =
    wwhile ((fun x -> let result = (f x) in (result, result = b)), b)


(* ffor: int * int * (int -> unit) -> unit
   Applies the function f to all the integers between low and high
   inclusive; the results get thrown away.
 *)

let rec ffor (low,high,f) = 
  if low>high 
  then () 
  else let _ = f low in ffor (low+1,high,f)
      
(************** Add Testing Code Here ***************)

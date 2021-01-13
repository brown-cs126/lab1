(* 1. List construction and elimination: *)

let list1 : int list = []

let list2 : int list = [ 42 ]

let list3 : int list = [ 2; 3 ]

let _ = assert ([ 42 ] = [ 42 ])

let _ = assert ([ 2; 3 ] = [ 2; 3 ])

let _ = assert ([ 2; 3 ] = [ 2 ] @ [ 3 ])

let _ = assert ([ 2; 3 ] = [ 2 ] @ [] @ [ 3 ])

(* Exercise: construct a list that has the integers 1 through 5 in it. Use the square bracket notation for lists. *)
let l1 : int list = []

(* Exercise: construct the same list, but do not use the square bracket notation. Instead use :: and []. *)
let l2 : int list = []

(* Exercise: construct the same list again. This time, the following expression must appear in your answer: [2;3;4]. Use the @ operator, and do not use ::. *)
let l3 : int list = []

let _ = match list2 with [] -> "hello" | e :: _ -> string_of_int e

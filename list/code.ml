(* 1. List construction and elimination: *)

(* [[]] construct an empty list  *)
let list1 : int list = []

(* [e :: es] construct a non-empty list, where [e] is the first element and [es] are the remaining. *)
let list2 : int list = 42 :: []

(* We can construct longer lists with [[]] and [(::)]. *)
let list3 : string list = "Welcome" :: "to" :: "CS1260" :: []

(* But there is a shorthand. *)
let list4 : string list = [ "Welcome"; "to"; "CS1260" ]

(* The function [(@)] concatenate two lists, for examples: *)

let _ = assert ([ 2; 3 ] = [ 2 ] @ [ 3 ])

let _ = assert ([ 2; 3 ] = [ 2 ] @ [] @ [ 3 ])

(* The assert function ensures that the two lists are the same [(=)]. *)

(* Exercise: construct a list that has the integers 1 through 5 in it. Use the square bracket notation for lists. *)
let l1 : int list = []

(* Exercise: construct the same list, but do not use the square bracket notation. Instead use :: and []. *)
let l2 : int list = []

(* Exercise: construct the same list again. This time, the following expression must appear in your answer: [2;3;4]. Use the @ operator, and do not use ::. *)
let l3 : int list = []


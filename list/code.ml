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

(* When you are ready, [cd] to [lab0/list] and run [dune test] *)

(* We have seen how to construct lists. It is time to destruct them! *)

(* [match] performs a case analysis on lists. The two cases correspond to two list constructors ([[]] and [(::)]). *)

let empty lst = 
  match lst with
  | [] -> true
  | _ :: _ -> false

let _ = assert (empty [])
let _ = assert (not (empty [2; 3]))

let head lst = 
  match lst with
  | [] -> raise (Failure "lst is empty")
  | h :: _ -> h

let tail lst = 
  match lst with
  | [] -> raise (Failure "lst is empty")
  | _ :: t -> t

let _ = assert (head ["a"; "b"; "c"] = "a")
let _ = assert (tail ["a"; "b"; "c"] = ["b"; "c"])

(* OCaml's pattern matching system is very powerful and intuitive. *)
let the_second_is_zero lst =
    match lst with
    | _ :: 0 :: _ -> true
    | _ -> false

let contains_three lst =
    match lst with
    | [_; _; _] -> true
    | _ -> false

(* Exercise: patterns [✭✭✭]

Using pattern matching, write three functions, one for each of the following properties. Your functions should return true if the input list has the property and false otherwise.
    the list's first element is "brown"
    the list has exactly two or four elements; do not use the length function
    the first two elements of the list are equal *)

let starting_with_brown lst =
    match lst with
    | _ -> false
let two_or_four lst =
    match lst with
    | _ -> false
let first_two_equal lst =
    match lst with
    | _ -> false

(* We will write more list functions in the next section. *)
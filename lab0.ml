open OUnit2

(* 2. Defining recursive functions *)

let rec fib : int -> int =
 fun n -> match n with 0 -> 1 | 1 -> 1 | n -> fib (n - 1) + fib (n - 2)

let rec length : int list -> int =
 fun ns -> match ns with [] -> 0 | _ :: ns -> 1 + length ns

let rec count_down : int -> int list =
 fun n -> if n = 0 then [ 0 ] else n :: count_down (n - 1)

let rec sum : int list -> int =
 fun ns -> match ns with [] -> 0 | n :: ns -> n + sum ns

let rec product : int list -> int =
 fun ns -> match ns with [] -> 1 | n :: ns -> n * product ns

(* 
product [5; 4; 0; 3; 2]
= 5 * product [4; 0; 3; 2]
= 5 * (4 * product [0; 3; 2])
= 5 * (4 * (0 * product [3; 2]))
= 5 * (4 * (0 * (3 * product [2])))
= 5 * (4 * (0 * (3 * (2 * product []))))
= 5 * (4 * (0 * (3 * (2 * 1))))
= 5 * (4 * (0 * (3 * 2)))
= 5 * (4 * (0 * 6))
= 5 * (4 * 0)
= 5 * 0
= 0

product_helper 1 [5; 4; 0; 3; 2]
= product_helper 5 [4; 0; 3; 2]
= product_helper 20 [0; 3; 2]
= 0
 *)
let rec product_helper : int -> int list -> int =
 fun p ns ->
  match ns with [] -> p | 0 :: _ -> 0 | n :: ns -> product_helper (p * n) ns

let product_fast : int list -> int = product_helper 1

(* 
(* alternatively *)
let product_fast : int list -> int = fun ns -> product_helper 1 ns
(* alternatively *)
let product_fast : int list -> int = fun ns -> (product_helper 1) ns
 *)

let _ = assert (1 = product [])

let _ = assert (1 = product_fast [])

let _ = assert (6 = product [ 2; 3 ])

let _ = assert (6 = product_fast [ 2; 3 ])

(* trace product_fast *)

let rec fib_helper : int -> int -> int -> int =
 fun prev cur n -> if n = 0 then cur else fib_helper cur (prev + cur) (n - 1)

let fib_fast : int -> int = fun n -> fib_helper 0 1 n

(* trace fib_helper *)

(* Understanding and reading higher-order and polymorphic functions: *)

(* rewrite some previously defined recursive functions with `function`
   instead of `fun ... match ...` *)

let _ = assert ([ 1; 2; 3 ] = List.map (fun n -> n + 1) [ 0; 1; 2 ])

let _ =
  assert (
    [ "0a"; "1b"; "2c" ]
    = List.mapi (fun i s -> string_of_int i ^ s) [ "a"; "b"; "c" ] )

let range : int -> int list = fun n -> List.rev (count_down n)

let _ =
  assert (
    [ 3; 2; 1; 0; 2; 1; 0; 1; 0; 0 ] = List.concat_map count_down (count_down 3)
  )

(* 
List.fold_left f a [b0; b1; ...; bn]
= (f ... (f (f a b0) b1) ... bn)
 *)

let _ =
  assert (
    "-123" = List.fold_left (fun s n -> s ^ string_of_int n) "-" [ 1; 2; 3 ] )

let test_sum _ = assert_equal ~printer:string_of_int (sum [ 3; 1; 2 ]) 6

let test_fib _ = assert_equal ~printer:string_of_int (fib_fast 6) 13

let tests = "lab0" >::: [ "test_sum" >:: test_sum; "test_fib" >:: test_fib ]

let _ = run_test_tt_main tests

(* Using tuples and records (with let and match) *)

type lecturer = { name : string; course : int }

let rc = { name = "Doug"; course = 1260 }

let _ =
  assert (rc.name = "Doug");
  assert (rc.course = 1260)

let { name; course } = rc

let _ =
  assert (name = "Doug");
  assert (course = 1260)

let tp : string * int = ("Doug", 1260)

let name, course_number = tp

let _ =
  assert (name = "Doug");
  assert (course_number = 1260)

(* Define new algebraic data type also mention the distinction between tuples and lists *)

(* type intlist = [] | (::) of int * intlist *)

(* type check *)
type 'a list = [] | Cons of ('a * 'a list)

let pr : int * int list = (1, [])

let (_ : int list) = Cons pr

(* 
let _ : int list = ((::) (1, []))
let _ = assert (((::) (1, [])) = (1 :: [])) *)

(* Introduction and elimination of options and exceptions *)

(* TODO *)

(* Also cover some pitfalls (= vs ==; f x y vs f(x,y)); ^ is string concat; rebinding is shadowing instead of mutation) *)

(* TODO *)

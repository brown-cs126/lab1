(* Option and Exception *)

(* Based on
    https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/data/options.html
    and 
    https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/data/exceptions.html *)

let rec list_max = function
  | [] -> raise (Failure "todo")
  | h :: t -> max h (list_max t)

(* 
There are a couple possibilities to consider:
- Return min_int. But then list_max will only work for integers — not floats or other types.
- In Java, you might return null. OCaml does not have a null value. Which is actually a good thing: null pointer bugs are not fun to debug.
- Raise an exception. But then the user of the function has to remember to catch the exception.
- In addition to those possibilities, OCaml provides something even better called an option. (Haskellers will recognize options as the Maybe monad.)
 *)

let (_ : int option) = Some 42

let (_ : int option) = None

let extract o = match o with Some i -> string_of_int i | None -> ""

let _ = assert (extract (Some 42) = "42")

let _ = assert (extract None = "")

let rec list_max_opt = function
  | [] -> None
  | h :: t -> (
      match list_max_opt t with None -> Some h | Some m -> Some (max h m) )

exception Max_undefined

let rec list_max_exn = function
  | [] -> raise Max_undefined
  | h :: t -> (
      match list_max_exn t with m -> max h m | exception Max_undefined -> h )

(* Exceptions are convenient when they are truely exceptional. For example,
when you know [list_max] is only applied to non-empty lists. *)

let (_ : int list) = List.map list_max_exn [ [ 1; 2; 3 ]; [ 42 ]; [ 4; 5 ] ]

(* Exceptions forget all computation between the raise and the nearest catching [match].
 This behavior is sometimes useful. *)

exception Found_zero

let rec product_helper = function
  | [] -> 1
  | 0 :: _ -> raise Found_zero
  | n :: ns -> n * product_helper ns

(* 
product_helper [1; 2; 0; 3]
= 1 * product_helper [2; 0; 3]
= 1 * 2 * product_helper [0; 3]
= 1 * 2 * raise Found_zero
raise Found_zero
 *)

let product ns =
  match product_helper ns with n -> n | exception Found_zero -> 0

(* But this behavior might stop your code unexpectedly. *)

let _ =
  match List.map list_max_exn [ []; [ 1; 2; 3 ]; [ 42 ]; [ 4; 5 ] ] with
  | _ -> ()
  | exception Max_undefined -> ignore "Bad thing happened"

let (_ : int option list) =
  List.map list_max_opt [ []; [ 1; 2; 3 ]; [ 42 ]; [ 4; 5 ] ]

(* In general, [option]s are safer to use because they remind us that there is a special case. *)

(* Exercise: date before [✭✭]

Define a date-like triple to be a value of type [int*int*int]. Examples of date-like triples include [(2013, 2, 1)] and [(0,0,1000)]. A date is a date-like triple whose first part is a positive year (i.e., a year in the common era), second part is a month between 1 and 12, and third part is a day between 1 and 31 (or 30, 29, or 28, depending on the month and year). (2013, 2, 1) is a date; (0,0,1000) is not.
Write a function is_before that takes two dates as input and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.)
Your function needs to work correctly only for dates, not for arbitrary date-like triples. However, you will probably find it easier to write your solution if you think about making it work for arbitrary date-like triples. For example, it's easier to forget about whether the input is truly a date, and simply write a function that claims (for example) that January 100, 2013 comes before February 34, 2013—because any date in January comes before any date in February, but a function that says that January 100, 2013 comes after February 34, 2013 is also valid. You may ignore leap years. *)

(* Exercise: earliest date [✭✭✭] 

Write a function [earliest : (int*int*int) list -> (int*int*int) option]. It evaluates to [None] if the input list is empty, and to [Some d] if date d is the earliest date in the list. Hint: use is_before. *)

(* Exercise: matching [✭]

For each pattern in the list below, give a value of type [int option list] that does not match the pattern and is not the empty list, or explain why that's impossible.

    (Some x)::tl
    [Some 3110; None]
    [Some x; _]
    h1::h2::tl
    h :: tl
 *)

# lab0

## Content

1. List construction and elimination:
   1. `[]` and `(::)`
   2. pattern matching lists (demonstrate `_`, exhaustiveness and unused branches ) 
   3. More syntaxes for list construction (e.g. `[e]` and `[e;e]` and `[e;e;e]`)
   4. List appending (`(@)`)
2. Defining recursive functions:
   1. defining some recursive functions on lists (e.g. `length`, `sum`, `product`) 
   2. (maybe, not urgently) Mutual recursion (`let rec … and … in …`)
   3. Helper functions that use accumulators (`product`, `fib_fast`, concatenating binary tree nodes)
   4. Demonstrate #trace
   5. Show different ways to call a function (e.g. `(f x y)` and `((f x) y)`)
3. Understanding and reading higher-order and polymorphic functions:
   1. Introduction to lambdas (`fun` and `function` as a shorthand for `fun` and `match`) 
   2. using `List.map`, `List.mapi`, `List.concat` (and `(@)`), `List.concat_map`, `List.fold_left`, `List.fold_right` (maybe) 
   3. during this section we would go through the official documentation/VSCode hints (autocomplete and mouse hover) with the students and show how to read polymorphic function signatures, however students will not be required to write their own polymorphic function during this lab 
4. using OUnit2. This should include an example of passing the optional `~printer` argument to `assert_equal`
5. introduction and elimination of tuples and records (with `let` and `match`)
6. define their own algebraic data type (e.g. list, binary tree), also mention the distinction between tuples and lists
7. introduction and elimination of options and exceptions
8. Also cover some pitfalls (`=` vs `==`; `f x y` vs `f(x,y)`); `^` is string concat; rebinding is shadowing instead of mutation)

## Demo or Exercises

(borrowed from Functional Programming in OCaml (Spring 2019 Edition))

Exercise: equality [✭]

    Write an expression that compares 42 to 42 using structural equality.
    Write an expression that compares "hi" to "hi" using structural equality. What is the result?
    Write an expression that compares "hi" to "hi" using physical equality. What is the result?

Exercise: list expressions [✭]

    Construct a list that has the integers 1 through 5 in it. Use the square bracket notation for lists.

    Construct the same list, but do not use the square bracket notation. Instead use :: and [].

    Construct the same list again. This time, the following expression must appear in your answer: [2;3;4]. Use the @ operator, and do not use ::.
    
Exercise: product [✭✭]

Write a function that returns the product of all the elements in a list. The product of all the elements of an empty list is 1. Hint: recall the sum function we defined in lecture.

Exercise: concat [✭✭, optional]

Write a function that concatenates all the strings in a list. The concatenation of all the strings in an empty list is the empty string "". Hint: this function is really not much different than sum or product. Put your code in a file named lab03.ml. Use the toplevel to test your code.
Exercise: bad add [✭✭]

Create a file named add.ml, and in it put the following buggy version of an addition function:

let add x y = 
  if x mod 7 = 0 then 0   (* bug *)
  else x+y

Now create a file named add_test.ml. Create and run an OUnit test suite for add in that file. Make sure to write some test cases that will pass (e.g., add 1 2) and some test cases that will fail (e.g., add 7 1).

Exercise: product test [✭✭, optional]

Unit test the function product that you wrote in an exercise above.
Exercise: patterns [✭✭✭]

Using pattern matching, write three functions, one for each of the following properties. Your functions should return true if the input list has the property and false otherwise.

    the list's first element is "bigred"
    the list has exactly two or four elements; do not use the length function
    the first two elements of the list are equal

Exercise: library [✭✭✭]

Consult the List standard library to solve these exercises:

    Write a function that takes an int list and returns the fifth element of that list, if such an element exists. If the list has fewer than five elements, return 0. Hint: List.length and List.nth.

    Write a function that takes an int list and returns the list sorted in descending order. Hint: List.sort with Pervasives.compare as its first argument, and List.rev.
    
Exercise: take drop [✭✭✭]

    Write a function take : int -> 'a list -> 'a list such that take n lst returns the first n elements of lst. If lst has fewer than n elements, return all of them.

    Write a function drop : int -> 'a list -> 'a list such that drop n lst returns all but the first n elements of lst. If lst has fewer than n elements, return the empty list.

Exercise: student [✭✭]

Assume the following type definition:

type student = { first_name : string ; last_name : string ; gpa : float }

Give OCaml expressions that have the following types:

    student
    student -> string * string (a function that extracts the student's name)
    string -> string -> float -> student (a function that creates a student record)

Here is a variant that represents a few Pokémon types:

type poketype = Normal | Fire | Water

Exercise: pokerecord [✭✭]

    Define the type pokemon to be a record with fields name (a string), hp (an integer), and ptype (a poketype).

    Create a record named charizard of type pokemon that represents a Pokémon with 78 HP and Fire type.

    Create a record named metapod of type pokemon that represents a Pokémon with 50 HP and Normal type.

Exercise: date before [✭✭]

Define a date-like triple to be a value of type int\*int\*int. Examples of date-like triples include (2013, 2, 1) and (0,0,1000). A date is a date-like triple whose first part is a positive year (i.e., a year in the common era), second part is a month between 1 and 12, and third part is a day between 1 and 31 (or 30, 29, or 28, depending on the month and year). (2013, 2, 1) is a date; (0,0,1000) is not.

Write a function is_before that takes two dates as input and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.)

Your function needs to work correctly only for dates, not for arbitrary date-like triples. However, you will probably find it easier to write your solution if you think about making it work for arbitrary date-like triples. For example, it's easier to forget about whether the input is truly a date, and simply write a function that claims (for example) that January 100, 2013 comes before February 34, 2013—because any date in January comes before any date in February, but a function that says that January 100, 2013 comes after February 34, 2013 is also valid. You may ignore leap years.

Exercise: earliest date [✭✭✭]

Write a function earliest : (int*int*int) list -> (int*int*int) option. It evaluates to None if the input list is empty, and to Some d if date d is the earliest date in the list. Hint: use is_before.

As in the previous exercise, your function needs to work correctly only for dates, not for arbitrary date-like triples.

Exercise: matching [✭]

For each pattern in the list below, give a value of type int option list that does not match the pattern and is not the empty list, or explain why that's impossible.

    (Some x)::tl
    [Some 3110; None]
    [Some x; _]
    h1::h2::tl
    h :: tl



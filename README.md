# lab0

## Content

1. Creating and using lists ([./list](./list))

   1. `[]` and `(::)`
   2. pattern matching lists (demonstrate `_` , exhaustiveness and unused branches ) 
   3. More syntaxes for list construction (e.g. `[e]` and `[e;e]` and `[e;e;e]` )
   4. List appending ( `(@)` )

2. Defining recursive functions ([./recursive_functions](./recursive_functions))

   1. defining some recursive functions on lists (e.g. `length` , `sum` , `product` ) 
   2. (maybe) Mutual recursion ( `let rec … and … in …` )
   3. Helper functions that use accumulators ( `product` , `fib_fast` , concatenating binary tree nodes)
   4. Demonstrate #trace
   5. Show different ways to call a function (e.g. `(f x y)` and `((f x) y)` )

3. Understanding and reading higher-order and polymorphic functions (demo only):

   1. introduction to lambdas ( `fun`; `function` as a shorthand for `fun` and `match` ) 
   2. using `List.map` , `List.mapi` , `List.concat` (and `(@)` ), `List.concat_map` , `List.fold_left` , (maybe) `List.fold_right`
   3. during this section we would go through the official documentation/VSCode hints (autocomplete and mouse hover) with the students and show how to read polymorphic function signatures, however students will not be required to write their own polymorphic function during this lab 

4. Unit testing with OUnit2 ([./testing](./testing))
5. Creating and using tuples and records and defining new algebraic data type. (also mention the distinction between tuples and lists) ([./tuples_records_and_adts](./tuples_records_and_adts))
7. Creating and using options and exceptions ([./option_and_exception](./option_and_exception))
8. Some pitfalls:
    - `=` vs `==`
    - `f x y` vs `f(x,y)`
    - `^` is string concat
    - rebinding is shadowing instead of mutation

## More Exercises

(All exercises are borrowed from Functional Programming in OCaml (Spring 2019 Edition))

### Exercise: product [✭✭]

Write a function that returns the product of all the elements in a list. The product of all the elements of an empty list is 1. Hint: recall the sum function we defined in lecture.

### Exercise: concat [✭✭, optional]

Write a function that concatenates all the strings in a list. The concatenation of all the strings in an empty list is the empty string "". Hint: this function is really not much different than sum or product. Put your code in a file named lab03.ml. Use the toplevel to test your code.

### Exercise: bad add [✭✭]

Create a file named add.ml, and in it put the following buggy version of an addition function:

let add x y = 
  if x mod 7 = 0 then 0   (* bug *)
  else x+y

Now create a file named add_test.ml. Create and run an OUnit test suite for add in that file. Make sure to write some test cases that will pass (e.g., add 1 2) and some test cases that will fail (e.g., add 7 1).

### Exercise: product test [✭✭, optional]

Unit test the function product that you wrote in an exercise above.

### Exercise: library [✭✭✭]

Consult the List standard library to solve these exercises:

    Write a function that takes an int list and returns the fifth element of that list, if such an element exists. If the list has fewer than five elements, return 0. Hint: List.length and List.nth.

    Write a function that takes an int list and returns the list sorted in descending order. Hint: List.sort with Pervasives.compare as its first argument, and List.rev.
    
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



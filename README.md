# lab0

## Content

1. List construction and elimination:
   1. `[]` and `(::)`
   2. pattern matching lists (demonstrate `_`, exhaustiveness and unused branches ) 
   3. More syntaxes for list construction (e.g. `[e]` and `[e;e]` and `[e;e;e]`)
2. Defining recursive functions:
   1. defining some recursive functions on lists (e.g. `length`, `sum`, `product`) 
   2. (maybe, not urgently) Mutual recursion (`let rec … and … in …`)
   3. Helper functions that use accumulators (`product`, `fast-fib`, concatenating binary tree nodes)
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

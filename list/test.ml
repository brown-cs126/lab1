open OUnit2

let string_of_int_list l =
  "[ " ^ String.concat "; " (List.map string_of_int l) ^ " ]"

let assert_int_list_equal l1 l2 = assert_equal ~printer:string_of_int_list l1 l2

let test1 _ = assert_int_list_equal [ 1; 2; 3; 4; 5 ] Code.l1

let test2 _ = assert_int_list_equal [ 1; 2; 3; 4; 5 ] Code.l2

let test3 _ = assert_int_list_equal [ 1; 2; 3; 4; 5 ] Code.l3

let suite =
  "test_lists" >::: [ "test1" >:: test1; "test2" >:: test2; "test3" >:: test3 ]

let () = run_test_tt_main suite

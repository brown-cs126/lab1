(* Functions to be implemented during lecture section, collabratively with the students *)

type ptype = 
  TNormal | TFire | TWater

type mon = {name: string; hp : int; ptype: ptype}

let c = {name = "Charmander"; hp = 39; ptype = TFire}

let poke_names_recur (l : mon list) (acc: string list) = function
  | [] -> acc
  | p :: rest -> match p with 
    | {name = n, hp = h, ptype = _} -> String.concat "" [n; h]

let poke_names_map (l: mon list) = List.map (fun m -> m.name) l
  
type a' mylist = 
  | Empty 
  | Cons of a' * a' mylist

let rec contains l i = function 
  | Empty -> false 
  | x :: xs -> x = i || contains xs i
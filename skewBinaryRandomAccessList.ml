type 'a tree = Leaf of 'a | Node of 'a * 'a tree * 'a tree
type 'a rlist = (int * 'a tree) list

let empty = []
let is_empty = function [] -> true | _ -> false
  
let cons x = function
  | (w1, t1)::(w2, t2)::rest when w1 = w2
    -> (1 + w1 + w2, Node (x, t1, t2))::rest
  | rl -> (1, Leaf x)::rl

let head = function
  | [] -> raise (Invalid_argument "head: empty")
  | (_, Leaf x)::_ -> x
  | (_, Node (x, _, _))::_ -> x

let tail = function
  | [] -> raise (Invalid_argument "head: empty")
  | (_, Leaf _)::rest -> rest
  | (w, Node (_, t1, t2))::rest -> (w / 2, t1)::(w / 2, t2)::rest

let rec lookup_tree i = function
  | _, Leaf x ->
      if i = 0 then x 
      else raise (Invalid_argument "lookup_tree: empty")
  | w, Node (x, t1, t2) ->
      if i = 0 then x
      else 
        if i - 1 < w / 2 then lookup_tree (i - 1) (w / 2,  t1)
        else lookup_tree (i - 1 - w / 2) (w / 2, t2)

let rec lookup i = function
  | [] -> raise (Invalid_argument "lookup: empty")
  | (w, t)::rest -> 
      if i < w then lookup_tree i (w, t)
      else lookup (i - w) rest

let rec update_tree i v = function
  | _, Leaf _ ->
      if i = 0 then Leaf v 
      else raise (Invalid_argument "update_tree: empty")
  | w, Node (x, t1, t2) ->
      if i = 0 then Node (v, t1, t2)
      else 
        if i - 1 < w / 2 then Node (x, (update_tree (i - 1) v (w / 2,  t1)), t2)
        else Node (x, t1, (update_tree (i - 1 - w / 2) v (w / 2, t2)))

let rec update i v = function
  | [] -> raise (Invalid_argument "update: empty")
  | (w, t)::rest -> 
      if i < w then (w, (update_tree i v (w, t)))::rest
      else (w, t)::update (i - w) v rest

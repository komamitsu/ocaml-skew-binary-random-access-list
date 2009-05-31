type 'a tree = Leaf of 'a | Node of 'a * 'a tree * 'a tree
type 'a rlist = (int * 'a tree) list
val empty : 'a rlist
val is_empty : 'a rlist -> bool
val cons : 'a -> 'a rlist -> 'a rlist
val head : 'a rlist -> 'a
val tail : 'a rlist -> 'a rlist
val lookup : int -> 'a rlist -> 'a
val update : int -> 'a -> 'a rlist -> 'a rlist

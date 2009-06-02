module M = SkewBinaryRandomAccessList

let _ =
  let l = [100; 101; 102; 103; 104; 105; 106; 107; 108; 109] in
  let rl = List.fold_left (fun rl x -> M.cons x rl) M.empty l in
  assert ((M.head rl) = 109);
  assert ((M.lookup 0 rl) = 109);
  assert ((M.lookup 1 rl) = 108);
  assert ((M.lookup 2 rl) = 107);
  assert ((M.lookup 3 rl) = 106);
  assert ((M.lookup 4 rl) = 105);
  assert ((M.lookup 5 rl) = 104);
  assert ((M.lookup 6 rl) = 103);
  assert ((M.lookup 7 rl) = 102);
  assert ((M.lookup 8 rl) = 101);
  assert ((M.lookup 9 rl) = 100);
  assert ((M.head (M.tail rl)) = 108);
  assert ((M.lookup 0 (M.update 0 99 rl)) = 99);
  assert ((M.lookup 1 (M.update 1 99 rl)) = 99);
  assert ((M.lookup 2 (M.update 2 99 rl)) = 99);
  assert ((M.lookup 3 (M.update 3 99 rl)) = 99);
  assert ((M.lookup 4 (M.update 4 99 rl)) = 99);
  assert ((M.lookup 5 (M.update 5 99 rl)) = 99);
  assert ((M.lookup 6 (M.update 6 99 rl)) = 99);
  assert ((M.lookup 7 (M.update 7 99 rl)) = 99);
  assert ((M.lookup 8 (M.update 8 99 rl)) = 99);
  assert ((M.lookup 9 (M.update 9 99 rl)) = 99);
  assert (M.is_empty M.empty)


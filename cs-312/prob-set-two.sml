(* Part 2 *)
(* a *)
val product = List.foldl Int.* 1

(* b *)
fun even_odd_idx (a: 'a, (b1: 'a list, b2: 'a list)) : ('a list * 'a list) =
    if (length b1 = length b2) then
        (b1 @ [a], b2)
    else
        (b1, b2 @ [a])

(* Any way I can make this point free? *)
fun partition (l: 'a list) :  ('a list * 'a list) = List.foldl even_odd_idx ([], []) l

(* c *)
fun apply_twice_positive (i: int) = fn (f: int -> int, count: int) => if f(f i) > 0 then count + 1 else count
val count_positive_funcs = foldl (apply_twice_positive(~1)) 0

(* This returns 2! *)
val positive_count = count_positive_funcs [fn x => x + 1, fn x => x - 1, fn x => x * ~1, fn x => x*x]


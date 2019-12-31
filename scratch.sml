(* This file I am just putting random junk in as I try it out *)

val testList = [1,3,5,7,9,11,13]

fun reverse [] = []
  | reverse (hd::tl) = reverse tl @ [hd]


(* Did a challenge in SML - https://dev.to/thepracticaldev/daily-challenge-148-disemvowel-trolls-h76 *)
val vowels = [#"a", #"e", #"i", #"o", #"u"]
fun member_of (item, list) = List.exists (fn x => x = item) list
fun disemvowel s = implode (List.filter (fn x => not(member_of(Char.toLower x, vowels))) (explode s))


(* Attempting another challenge in SML -  https://dev.to/thepracticaldev/daily-challenge-149-fun-with-lamps-11nk*)
fun gen_alt (starting, next, len) = List.tabulate(len, fn x => if x mod 2 = 0 then starting else next)

fun diff ([], []) = 0
  | diff (x::xs, y::ys) = (if x = y then 0 else 1) + diff(xs, ys)
  | diff (_, _) = ~1 (* List lengths don't match for some reason *)

fun lamps [] = 0
  | lamps xs = Int.min(diff(xs, gen_alt(0, 1, length xs)), diff(xs, gen_alt(1, 0, length xs)))
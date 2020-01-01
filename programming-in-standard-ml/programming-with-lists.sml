(* Chapter 9 - Programming with Lists *)
fun sum nil = 0
    | sum (h::t) = h + sum t

fun length nil = 0
    | length (_::t) = 1 + length t

fun append (nil, l) = l
    | append (h::t, l) = h :: append (t, l)

(* Appending is build in as exp1 @ exp2 *)

fun rev nil = nil
    | rev (h::t) = rev t @ [h]

local
    fun helper (nil, a) = a
        | helper (h::t, a) = helper(t, h::a)
in
    fun rev' l = helper (l, nil)
end

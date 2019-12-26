(* Chapter 6 - Case Analysis *)
val 0 = 1 - 1
val (0, x) = (1 - 1, 34)
(* 
    val (0, #"0") = (2 - 1, #"0");  
    The above statement would fail to bind as 2-1 does not match 0, therfore this statement would fail 
*)

(* Functions over heterogeneous types *)
val recip : int -> int =
    fn 0 => 0 | n: int => 1 div n

(* More concise way of writing above w/ fun notation *)
fun recip 0 = 0
    | recip (n: int) = 1 div n

(* boolean is heterogeneous - this is a reimplementation of the not function! *)
fun not true = false
    | not false = true

(* For a well-formed match, exhaustiveness and reduncancy are both checked to aid the programmer *)
(* 
    The following implementation of recip is redundant, as the second clause will never be match, thuse resulting in
    an error - match redundat.
    
    fun recip (n: int) = 1 div n
        | recip 0 = 0 
*)

(* 
    Non-exhaustive, will give warning for being non-exhaustive
    In the event of invoking is_numeric #"a", a runtime error will be thrown
    for a nonexhaustive match failure
*)
fun is_numeric #"0" = true
    | is_numeric #"1" = true
    | is_numeric #"2" = true
    | is_numeric #"3" = true
    | is_numeric #"4" = true
    | is_numeric #"5" = true
    | is_numeric #"6" = true
    | is_numeric #"7" = true
    | is_numeric #"8" = true
    | is_numeric #"9" = true

(* 
    Utilizing our throwaway patter, _, we define a catch all to hanlde the case of is_numeric #"a" so that it correctly returns false.
    This catch all is correct for this use case, but I need to make sure to think about when to use it, and use it sparingly.
*)
fun is_numeric #"0" = true
    | is_numeric #"1" = true
    | is_numeric #"2" = true
    | is_numeric #"3" = true
    | is_numeric #"4" = true
    | is_numeric #"5" = true
    | is_numeric #"6" = true
    | is_numeric #"7" = true
    | is_numeric #"8" = true
    | is_numeric #"9" = true
    | is_numeric _ = false
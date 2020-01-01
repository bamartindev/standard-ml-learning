(* Chapter 11 - Higher-Order Functions *)

(* Functionas are first-class in SML, which means that they can be passed as arguments and returned from funcs *)
(* Revisiting some scoping as it pertains to functions *)
val x = 2
fun f y = x + y
val x = 3
val z = f 4 (* What is z in this case? 6! *)

(* Free variable in a function definition is any variable referenced that is not a parameter *)

fun map' (f, nil) = nil
  | map' (f, h::t) = (f h) :: map'(f, t)

val plus_one = fn x => x + 1

val res = map' (plus_one, [1,2,3,4])

val constantly = fn k => (fn a => k)
fun constantly k a = k

(* Curried map function so that way we can do something like map_times_two instead of writing it over and over *)
fun map f nil = nil
  | map f (h::t) = (f h) :: (map f t)

val times_two = fn x => x * 2
val map_times_two = map times_two
val doubled = map_times_two [1,2,3,4] @ map_times_two [10,11,12,13]

(* codified currying - changing original map' to a curried verison maatching the above *)
fun curry f x y = f (x, y)
fun map f l = curry map' f l

(* Section on patterns of control *)
fun add_up nil = 0
  | add_up (h::t) = h + add_up t

fun mul_up nil = 1
  | mul_up (h::t) = h * mul_up t


(* The above functions can be abstracted to this reduce function *)
fun reduce (unit, opn, nil) = unit
  | reduce (unit, opn, h::t) =
    opn (h, reduce (unit, opn, t))

(* The redefinition of add_up and mul_up using reduce *)
fun add_up l = reduce (0, op +, l)
fun mul_up l = reduce (1, op *, l)

(* identity of a list? *)
fun mystery l = reduce (nil, op ::, l)

fun better_reduce (unit, opn, l) =
    let
        fun red nil = unit
          | red (h::t) = opn (h, red t)
    in
        red l
    end

fun staged_reduce (unit, opn) =
    let
        fun red nil = unit
          | red (h::t) = opn (h, red t)
    in
        red
    end

fun curried_reduce (unit, opn) nil = unit
  | curried_reduce (unit, opn) (h::t) =
    opn (h, curried_reduce (unit, opn) t)

val staged_add = staged_reduce (0, op +)


fun append (nil, l) = l
  | append (h::t, l) = h :: append(t, l)

fun curried_append nil l = l
  | curried_append (h::t) l = h :: curried_append t l

fun staged_append nil = (fn l => l)
  | staged_append (h::t) =
    let
        val tail_appender = staged_append t
    in
        fn l => h :: tail_appender l
    end


val s = staged_append [1,2,3,4]
val t = s [4,5,6,7] (* results in [1,2,3,4,4,5,6,7] *)
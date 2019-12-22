(* Variables *)

(* Once a variable is bound, it is bound for life - no changing! *)
(* Types can be bound to a type constructor using a type binding - type bindings are sometimes called type abbreviations *)

(* Some examples of type bindings *)
type float = real
(* Can do multiple bindings in one line separated by and *)
type count = int and average = real

(* Examples of value bindings - binding can specify the type or let it be inferred *)
val firstname = "Jim"
(* This can also do multiple bindings of values separated by and *)
val num : count = 32 and lastname : string = "Bob"
(* We can also do some complex bindings *)
val fullname = firstname ^ " " ^ lastname
val addition : count = 100 + 300

(* While binding will never change, we can shadow a binding by doing another bind to the same name *)
val num : real = 3.14

(* Limiting scope with variable declarations *)
val m = 10
val n = m * m

(* Let expression where we limit the scope of m & n until the end of the expression *)
val result  = let
    val m : int = 3
    val n : int = m * m
in
    m * n
end

(* Just showing that m & n are unmodified in this scope after the let statement *)
val unchanged : bool = not (m * n = result)

val a : int = 0
val x : real = Math.sqrt(2.0)
val c : char = #"a"
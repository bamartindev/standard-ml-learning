(* Chapter 8 - Type Inference and Polymorphism *)

(* 
    Type inference allows us to write function signatures and define vars without having to explicitly
    state what the type is (int, real, string, etc.) 
*)
val newline = fn (s: string) => s ^ "\n"
val newline' = fn s => s ^ "\n"

(* Type variables for a polymorphic identity function *)
val id : 'a -> 'a = fn x => x
fun id(x: 'a) : 'a = x
(* Of course, not specifying the type in this case will end up polymorphic as well *)
fun id'(x) = x

val doubles =
    let
      val double = fn x => x+x
    in
      (double 3, double 4)
    end


(*  No concept of allocation / deallocation from the developers perspective *)

(* Lets kick it off with the tuple! *)
val pair : int * int = (2, 3)
val triple : int * real * string = (2, 2.0, "2") (* Tuples can contain any type of data, doesn't have to be homogeneous *)
val quad
    : int * int * real * real
    = (2, 3, 2.0, 3.0)  (* can keep extending tuples out to n-elements, called an n-tuple *)
val pair_of_pairs
    : (int * int) * (real * real)
    = ((2, 3), (2.0, 3.0)) (* This is a tuple of tuples, not a quad tuple like above! *)

val unit = () (* This is a 0-tuple, also known as null tuple, which has the value of type unit *)

(* 1-tuples don't exists, it will essentially evaluate the value inside of the parens with precedence *)

val eval : int * int = (1 + 1, 10 - 2) (* Evaluation (from left to right) will occur before construction of the tuple *)

(* Pattern Matching! *)
type foo = (int * string) * (real * char)
val data : foo = ((1, "1"), (10.7, #"a"))

val ((i: int, _), (r: real, _)) = data (* At this point, we pattern matched and bound the value 1 into the variable i, and 10.7 into the variable r! *)
val (is: int * string, rc: real * char) = data (* pattern matching at the tuple level instead of internal to the tuple like above *)

(*  No concept of allocation / deallocation from the developers perspective *)

(* Lets kick it off with the tuple! *)
val pair : int * int = (2, 3)

(* Tuples can contain any type of data, doesn't have to be homogeneous *)
val triple : int * real * string = (2, 2.0, "2") 

(* can keep extending tuples out to n-elements, called an n-tuple *)
val quad
    : int * int * real * real
    = (2, 3, 2.0, 3.0)  

(* This is a tuple of tuples, not a quad tuple like above! *)
val pair_of_pairs
    : (int * int) * (real * real)
    = ((2, 3), (2.0, 3.0))

(* This is a 0-tuple, also known as null tuple, which has the value of type unit *)
val unit = () 

(* 1-tuples don't exists, it will essentially evaluate the value inside of the parens with precedence *)

(* Evaluation (from left to right) will occur before construction of the tuple *)
val eval : int * int = (1 + 1, 10 - 2) 

(* Pattern Matching! *)
type foo = (int * string) * (real * char)
val data : foo = ((1, "1"), (10.7, #"a"))

(* At this point, we pattern matched and bound the value 1 into the variable i, and 10.7 into the variable r! *)
val ((i: int, _), (r: real, _)) = data 

(* pattern matching at the tuple level instead of internal to the tuple like above *)
val (is: int * string, rc: real * char) = data 

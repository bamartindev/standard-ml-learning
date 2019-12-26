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


(* And on to Record Types!  This is sort of like labeled tuples *)
(* This is a record type *)
type hyperlink = 
    { protocol : string,
       address : string,
       display : string }

(* This is a record binding *)
val mailto : hyperlink =
    { protocol="mailto",
       address="bamartindev@gmail.com",
       display="Brett Martin" }

(* Pattern matching decomposition works the same as above *)
(* The variables being bound are proto, disp, and addr *)
val { protocol=proto, display=disp, address=addr } = mailto

(* An ellipses pattern can be used when we want to only match a subset of labels *)
val { protocol=prot, ... } = mailto

(* Can also do a binding where the labels will be used as the variable names *)
val { protocol, display, address } = mailto

(* 5.3 - Multiple Arguments and Multiple Results *)
fun dist (x: real, y: real) : real = Math.sqrt (x*x + y*y)

(* 
    Can also do keyword parameter passing with record patterns!
    The following function can be called like: dist' {x=2.0, y=3.0}
*)
fun dist' {x=x:real, y=y:real} = Math.sqrt (x*x + y*y)

(* Wrote a small abs function since the book had Math.abs but that doesn't appear to exist? *)
fun abs (n: real) : real = if n<0.0 then ~n else n;
(* Yielding multiple results (as a tuple) *)
fun dist2 (x:real, y:real):real*real= (Math.sqrt (x*x+y*y), abs(x-y))

(* The last goodie from this chapter is the introduction of sharp notation *)
(* Code given as an example of overuse of sharp notation *)
fun distance (p: real * real) : real
    = Math.sqrt((#1 p) * (#1 p) + (#2 p) * (#2 p))

(* Similar notation is available for records as well *)
val person = { name="Brett Martin", age=28, profession="Software Developer" }
val name = #name person
val prof = #profession person
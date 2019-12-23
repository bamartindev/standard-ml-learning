(* Functions! *)

(* Binding of lambda, or anonymous, function to the name fourthroot *)
val fourthroot : real -> real =
    fn x : real => Math.sqrt(Math.sqrt x)

val result = fourthroot 40.25


(* Special syntax shorthand for defining named functions *)
(* 
    The following is the anonymous way of defining, followed by the new way!
    val greet : string -> string =
        fn name : string => "Hello, " ^ name ^ "!" 
*)
fun greet (name: string) : string 
    = "Hello, " ^ name ^ "!"

(* Because who doesn't love a good "Hello, World!"? *)
val bestResponse = greet "World"


(* Kinda went off topic but found some currying as well - http://people.cs.ksu.edu/~xou/505f10/slides/SMLfunctions.pdf *)
fun add (x: real) = fn(y: real) => fn(z: real) : real => x + y + z
val fifty = add 25.0 10.0 15.0

(* partial application to add 6 to the other two variables *)
val addSix = add 6.0
val fourtySix = addSix 30.0 10.0
(* ~ is negative *)
val zero = addSix 0.0 ~6.0

(* 
    Randomly found while messing around that reals cannot be compared for equality with just =
    Have to use Real.== which isn't the most accurate.  See stack overflow link: 
    https://stackoverflow.com/questions/41394992/why-cant-i-compare-reals-in-standard-ml
    Not really function related but sticking it here for now :D
*)
val doesEq = Real.==(fourthroot 4.0, fourthroot(2.0 + 2.0))
val doesntEq = Real.==(fourthroot 4.0, fourthroot(2.0 + 3.0))


(* 
    Some examples copied from the text, nice to see small clean functions!
    Note: It appears that functions are snake_case while I have seen variables are camelCase.
*)
fun srev (s: string) : string = implode(rev(explode s))
fun pal (s: string) : string = s ^ (srev s)
fun double (x: int) : int = x + x
fun square (x: int) : int = x * x
fun halve (x: int) : int = x div 2
fun is_even (x: int) : bool = (x mod 2 = 0)


val x: int = 2
fun f(x: int) : int = x + x
fun g(y: int) : int = x + y

(* 
    The above functions take the scoping rules learned in the previous section and illustrate
    how we shadow x during application of f, but we use the existing value of 2 in the application
    of function g.
*)
(* Probably a better way to assert stuff, will need to research that *)
val fResult = (f 10 = 20)
val gResult = (g 10 = 12)

(* Internal shadowing in a function - not sure when this would be used - using a let expression *)
fun h(x: int) : int =
    let val x: int = 5 in x + x end * x

(* 
    The above function takes as input an int we call x, then uses x again local to the function to do x + x
    before finally taking that result (10) * x, where this x is the value applied to the function 
*)

val hResult = (h 7 = 70)
(* Chapter 12 - Exceptions *)

(* Exceptions are an example of effects in ML, along with mutation, input/output and communication *)

(* Here is a "checked" factorial function, utilizing an exception if the value is negative *)
exception Factorial
fun checked_factorial n =
    if n < 0 then
        raise Factorial
    else if n = 0 then
        1
    else n * checked_factorial(n - 1)

(* rewrite to avoid checking the precondition of non-negative each recursive call *)
local
    fun fact 0 = 1
      | fact n = n * fact (n - 1)
in
    fun checked_factorial n =
      if n >= 0 then
            fact n
      else
            raise Factorial
end

(* Looked up how to read an integer from keyboard input here: https://stackoverflow.com/q/43075607/3705768 *)
fun read_integer () = (
    print "Please enter an integer for factorial: ";
    let
        val str = valOf (TextIO.inputLine TextIO.stdIn)
        val i : int = valOf (Int.fromString str)
    in
        i
    end
)

(* Just an example of an exception handler *)
fun fact_driver () =
    let
        val input = read_integer ()
        val result =
            Int.toString (checked_factorial input)
    in
        print (result ^ "\n")
    end
    handle Factorial => print "Out of range.\n" 

exception Change
fun change _ 0 = nil
  | change nil _ = raise Change
  | change (coin::coins) amt = 
    if coin > amt then
        change coins amt
    else
        (coin :: change (coin::coins) (amt-coin))
        handle Change => change coins amt

(* Can attach values to an exception *)
exception SyntaxError of string

fun sample 0 = raise SyntaxError "Zero is a figment of your imagination\n"
  | sample n = n

fun sample_driver n =
    let
        val result = Int.toString ((sample n) + 10)
    in
        print (result ^ "\n")
    end
    handle SyntaxError msg => (print ("Syntax Error: " ^ msg))
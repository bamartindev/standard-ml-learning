(* Chapter 7 - Recursive Functions *)
val rec factorial : int -> int
    = fn 0 => 1 | n: int => n * factorial(n - 1)

fun factorial 0 = 1
  | factorial (n: int) = n * factorial(n - 1)


(* Using a helper is iterative, or tail recursive so it keeps the stack small *)
fun helper (0, r: int) = r
  | helper (n: int, r: int) = helper (n - 1, n * r)

fun factorial (n: int) = helper (n, 1)

(* Common practice to conceal the definitions of a helper via local decl *)
local
    fun helper (0, r: int) = r
      | helper (n: int, r: int) = helper (n - 1, n * r)
in
    fun factorial (n: int) = helper (n, 1)
end

fun fib 0 = 1
  | fib 1 = 1
  | fib (n: int) = fib(n - 1) + fib (n - 2)

fun fib' 0 = (1, 0)
  | fib' 1 = (1, 1)
  | fib' (n: int) =
    let
        val (a: int, b: int) = fib' (n - 1)
    in
        (a+b, a)
    end

(* Mutual recursion (saw this mentioned in the intro of my compilers in ML book!) *)
(* Obviously not a good way to tell if even / odd but illustrates a mutually recursive setup *)
fun even 0 = true
  | even n = odd (n - 1)
and odd 0 = false
  | odd n = even (n - 1)
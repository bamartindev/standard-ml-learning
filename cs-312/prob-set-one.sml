(* Doing some stuff from problem set 1 - https://www.cs.cornell.edu/courses/cs312/2008sp/hw/ps1/ps1.html *)


(* Part 3 *)
exception NumberFormatException

fun parseInt (s: string) : int = 
    let
        val SOME x = Int.fromString s
    in
        x
    end
    handle Bind => raise NumberFormatException


datatype tree = Node of tree list

val tt = Node([Node([Node([Node([])])]), Node([Node([]), Node([Node([])])]), Node([Node([])])])

fun treeSize (Node([])) = 1
  | treeSize (Node(x::[])) = 1 + treeSize x
  | treeSize (Node(x::xs)) = (treeSize x) + (treeSize (Node(xs)))

val correctSize = treeSize tt = 10

fun rev [] = []
  | rev (hd::tl) = rev tl @ [hd]
  
fun isWhitespace c = c = #" "
fun reverseWords words = 
    String.concatWith " " (rev (String.tokens isWhitespace words))

val reversed = (reverseWords "A MAN A PLAN A CANAL PANAMA") = "PANAMA CANAL A PLAN A MAN A"
(* Chapter 10 - Concrete Data Types *)

(* nullary type constructor - convention is to capitalize the names of value constructors *)
datatype suit = Spades | Hearts | Diamonds | Clubs

fun outranks (Spades, Spades) = false
  | outranks (Spades, _) = true
  | outranks (Hearts, Spades) = false
  | outranks (Hearts, Hearts) = false
  | outranks (Hearts, _) = true
  | outranks (Diamonds, Clubs) = true
  | outranks (Diamonds, _) = false
  | outranks (Clubs, _) = false

datatype 'a option = NONE | SOME of 'a

fun expt (NONE, n) = expt (SOME 2, n)
  | expt (SOME b, 0) = 1
  | expt (SOME b, n) =
    if n mod 2 = 0 then
        expt (SOME (b*b), n div 2)
    else
        b * expt (SOME b, n - 1)

type entry = { name: string, spouse: string option }

fun reciprocal 0 = NONE
  | reciprocal n = SOME (1 div n)

fun get_result x = 
    case (x)
        of NONE => "Neat, got none for reciprocal 0\n"
        | SOME r => "Not sure how I just got here...\n"

(* 
    I have not read anything about it yet, but I it appears that I cannot just write a 
    let..in..end statement outside of a binding of some sort? 
    Anyways, this was just playing around to evaluate recip + print something
*)
fun eval _ = 
    let
        val result = reciprocal 0;
    in
        print(get_result result)
    end

(* Recursive datatypes! *)
datatype 'a binarytree =
    Empty |
    Node of 'a binarytree * 'a * 'a binarytree

(* Sample binary tree to test height + size against *)
val bt = Node(Node(Node(Empty, 2, Empty), 4, Node(Empty, 3, Empty)), 5, Empty) 

(* wrote a little max function since there didn't seem to be one *)
fun max (x, y) = if x > y then x else y

fun height Empty = 0
  | height (Node (lft, _, rht)) =
    1 + max (height lft, height rht)

fun size Empty = 0
  | size (Node (lft, _, rht)) =
    1 + size lft + size rht

datatype 'a tree =
    Empty |
    Node of 'a * 'a tree list

(* Variadic tree definition with mutually recursive datatypes *)
datatype 'a tree =
    Empty |
    Node of 'a * 'a forest
and 'a forest =
    None |
    Tree of 'a tree * 'a forest


(* Sample variadic tree to test height + size_tree against *)
val vt = Node(1, Tree(Node(2, None), None))

fun size_tree Empty = 0
  | size_tree (Node (_, f)) = 1 + size_forest f
and size_forest None = 0
  | size_forest (Tree (t, f')) = size_tree t + size_forest f'


(* Another binary tree representation *)
datatype 'a tree =
    Empty |
    Node of 'a branch * 'a branch
and 'a branch =
    Branch of 'a * 'a tree

val t = Node(Branch(15, Node(Branch(7, Empty), Branch(26, Empty))), Branch(2,Node(Branch(5, Empty), Branch(76, Node(Branch(69, Empty), Branch(99, Empty))))))

fun collect Empty = nil
  | collect (Node (Branch (ld, lt), Branch (rd, rt))) =
    ld :: rd :: (collect lt) @ (collect rt)

datatype int_or_string =
  Int of int |
  String of string

type int_or_string_tree =
  int_or_string tree

datatype expr = 
  Numeral of int |
  Plus of expr * expr |
  Times of expr * expr |
  Recip of expr

fun eval (Numeral n) = Numeral n
  | eval (Plus (e1, e2)) = 
    let
        val Numeral n1 = eval e1
        val Numeral n2 = eval e2
    in
        Numeral(n1 + n2)
    end
  | eval (Times (e1, e2)) =
    let
        val Numeral n1 = eval e1
        val Numeral n2 = eval e2
    in
        Numeral(n1 * n2)
    end
  | eval (Recip e) =
    let
      val Numeral n = eval e
    in
      Numeral (1 div n)
    end

val test = Plus(Plus(Numeral(5), Numeral(7)), Times(Numeral(5), Recip(Numeral(~10))))


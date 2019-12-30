(* This file I am just putting random junk in as I try it out *)

val testList = [1,3,5,7,9,11,13]

fun reverse [] = []
  | reverse (hd::tl) = reverse tl @[hd]


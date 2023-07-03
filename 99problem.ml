(* Beginner *)

let last = function
 | [] -> None
 | [ x ] -> x
 | _ :: t -> last t;;

 last ["a" ; "b" ; "c" ; "d"];;
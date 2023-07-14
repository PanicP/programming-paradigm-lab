(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button or [Ctrl-e]. *)

let rec last = function [] -> None | [ x ] -> Some x | _ :: t -> last t
let rec product = function [] -> 1 | [ x ] -> x | h :: t -> h + product t
let rec concat = function [] -> "" | [ x ] -> x | h :: t -> h ^ concat t;;

assert (concat [ "1"; "2"; "3"; "4"; "5" ] = "12345")

let isbigred input = match input with [] -> false | h :: _ -> h = "bigred"
let is2or4 = function [ _; _ ] -> true | [ _; _; _; _ ] -> true | _ -> false
let first2equal = function a :: b :: _ -> a = b | _ -> false
let return5th input = if List.length input < 5 then 0 else List.nth input 4
let sortlist input = List.rev (List.sort Stdlib.compare input)
let lastele input = List.nth input (List.length input - 1)
let zeroexists input = List.exists (fun x -> x = 0) input

let rec takeN lst n =
  match lst with
  | [] -> []
  | [ x ] -> [ x ]
  | h :: t -> if n = 0 then [] else h :: takeN t (n - 1)

let rec dropN lst n =
  match lst with [] -> [] | h :: t -> if n = 0 then h :: t else dropN t (n - 1)

let rec isuni = function
  | [] | [ _ ] -> true
  | h1 :: h2 :: t -> if h1 < h2 then isuni (h2 :: t) else false

let createstudent first last gpa = { first_name = first; last_name = last; gpa }

type pokemon = { name : string; hp : int; ptype : poketype }

let charizard : pokemon = { name = "Charizard"; hp = 78; ptype = Fire }
let safe_hd = function [] -> None | h :: _ -> Some h
let rec safe_tl = function [] -> None | [ x ] -> Some x | h :: t -> safe_tl t

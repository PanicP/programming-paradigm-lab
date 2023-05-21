(* Exercise: fib [★★] *)
let rec fib n =
  if n = 0 then 0 else if n = 1 then 1 else fib (n - 1) + fib (n - 2)

(* Exercise: fib fast [★★★] *)
let rec fibfast n pp p = if n = 1 then p else fibfast (n - 1) p (pp + p)
(* let res = fibfast 50 0 1;; *)

(* Exercise: poly types [★★★] *)
let f x = if x then x else x
let g x y = if y then x else x
let h x y z = if x then y else z
let i x y z = if x then y else y

(* Exercise: divide [★★] *)
let divide ~numerator:x ~denominator:y = x /. y

(* Exercise: associativity [★★] *)

let add x y = x + y;;

print_int (add 5 1);;
print_int ((add 5) 1)

(* add (5 1);; *)

(* Exercise: average [★★] *)

let ( +/. ) x y = (x +. y) /. 2.;;

print_float (2. +/. 3.);;

(* Exercise: hello world [★] *)
print_endline "Hello world!";;
print_string "Hello world!"

(* ---------------------------- *)

(* Exercise: list expressions [★] *)
let arr1 = [ 1; 2; 3; 4; 5 ]
let arr2 = [ 1; 2; 3; 4; 5 ]
let arr3 = [ 1 ] @ [ 2; 3; 4 ] @ [ 5 ]

(* Exercise: product [★★] *)
let rec sumlist = function [] -> 1 | h :: t -> h * sumlist t;;

print_int (sumlist arr1)

(* Exercise: concat [★★] *)
let rec concatstring = function [] -> "" | h :: t -> h ^ concatstring t;;

print_string (concatstring [ "a"; "b"; "c" ])

(* Exercise: patterns [★★★] *)
let starts_with_bigred = function "bigred" :: _ -> true | _ -> false

let list_2_or_4 = function
  | [ _; _ ] -> true
  | [ _; _; _; _ ] -> true
  (* | _ :: _ :: [] -> true
     | _ :: _ :: _ :: _ :: [] -> true *)
  | _ -> false

let list_1_2_equal = function a :: b :: _ when a = b -> true | _ -> false;;

Printf.printf "My boolean is: %B\n"
  (starts_with_bigred [ "bigred"; "sdfadfasfd"; "23" ])
;;

Printf.printf "My boolean is: %B\n" (list_2_or_4 [ "bigred"; "sdfadfasfd" ]);;
Printf.printf "My boolean is: %B\n" (list_1_2_equal [ "data"; "data" ])

(* Exercise: take drop [★★★] *)
let rec takelist n lst =
  if n = 0 then []
  else match lst with [] -> [] | x :: newlist -> x :: takelist (n - 1) newlist

let rec droplist n lst =
  if n = 0 then lst
  else match lst with [] -> [] | x :: newlist -> droplist (n - 1) newlist

(* let testlist = [ ("a", "a", "a") ];;
   print_list (droplist 1 testlist) *)

(* Exercise: powerset [★★★] *)
let rec powerset s =
  match s with
  | [] -> [ [] ]
  | x :: xs ->
      let ps = powerset xs in
      ps @ List.map (fun set -> x :: set) ps

(* Exercise: student [★★] *)

(* Exercise: pokerecord [★★] *)

(* Exercise: date before [★★] *)

(* Exercise: matching [★] *)

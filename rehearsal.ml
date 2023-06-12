(* 1. For each of the following types, find an OCaml expression that has this type! *)

(* a. bool -> bool -> bool *)
a. let f x y = x && y 
(* The function f takes two boolean arguments x and y, and returns their conjunction (x && y). *)

(* b.  ́a ->  ́a list *)
b. let f x = [x] 
(* The function f takes an argument x of any type 'a, and returns a list containing only x *)

(* c. bool * bool list *)
c. let x = (true, [true;false]) 
(* The expression x is a pair consisting of a boolean value true and a list of boolean values [true;false]. *)

(* d. ( ́a ->  ́b) ->  ́a ->  ́b  *)
d. let apply f x = f x
(* The function apply takes two arguments f and x, where f is a function that takes an argument of type 'a and returns a value of type 'b, and x is a value of type 'a. apply applies f to x and returns the result, which has type 'b. *)

(* ######################################################### *)

(* 2. What is the principal type of the following OCaml expressions?*)

(* a. [] *)
a. 'a list
(* a. [] is an empty list, so its type is 'a list, which means it can be a list of any type. *)

(* b. ([],[]) *)
b. 'a list * 'b list
(* b. ([], []) is a pair of two empty lists, so its type is ('a list * 'b list), which means it can be a pair of any two lists of any two types. *)

(* c. fun _ -> [] *)
c. '_a -> 'b list
(* c. fun _ -> [] is a function that takes any input (represented by the _ wildcard pattern) and returns an empty list []. Its type is '_a -> 'b list, which means it takes any input of any type and returns a list of any type. *)

(* d. (|>)  *)
d. '_a -> ('_a -> 'b) -> 'b
(* d. The |> operator is the pipe-forward operator, which is used to chain functions together. It takes an input of type '_a and a function of type ('_a -> 'b) and returns the result of applying the function to the input. Its type is '_a -> ('_a -> 'b) -> 'b, which means it takes any input of any type, a function that takes an input of that same type and returns a value of any other type, and returns that same other type. *)

(* ######################################################### *)

(* 3. For each of the following functions, describe what they do and provide a non-trivial, illustrative example of an application.
a. let c lists = List.fold_left (@) [] lists
b. let k = List.map (fun x -> x > 10)
c. let g h x = h x |> not
d. let p f xs = (List.filter f xs, List.filter (g f) xs) < g from part (b) > *)

(* ######################################################### *)

(* 4. Consider the library function val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list, where map2 f [a1; ...; an] [b1; ...; bn] is [f a1 b1; ...; f an bn]. Use map2 to write a function val zip: 'a list -> 'b list -> ('a * 'b) list, such that, e.g. zip [1;2;3] [4;5;6] yields [(1,4);(2,5);(3,6)]. The behaviour is only required for lists of equal length (undefined otherwise). *)

(* ######################################################### *)

(* 5. Write a function val sumOfLargeSquares : int list -> int, that computes the sum of the squares of all list elements larger than 5, e.g. sumOfLargeSquares [3;4;5;6;7] yields 85. Do not use explicit recursion. *)

(* ######################################################### *)

(* 6. The following functions are not tail-recursive. Transform them into an equivalent tail recursive versions
a. let rec factorial n = if n = 0 then 1 else n * factorial n
b. let rec reverse xs = if xs = [] then [] else (reverse xs) @ [x] *)

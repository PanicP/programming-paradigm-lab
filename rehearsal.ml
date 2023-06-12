(* 1. For each of the following types, find an OCaml expression that has this type!
a. bool -> bool -> bool
b.  ́a ->  ́a list
c. bool * bool list
d. ( ́a ->  ́b) ->  ́a ->  ́b *)

a. let f x y = x && y 
(* The function f takes two boolean arguments x and y, and returns their conjunction (x && y). *)

b. let f x = [x] 
c. let x = (true, [true;false]) 
d. let apply f x = f x

(* 2. What is the principal type of the following OCaml expressions?
a. []
b. ([],[])
c. fun _ -> []
d. (|>) *)

(* 3. For each of the following functions, describe what they do and provide a non-trivial, illustrative example of an application.
a. let c lists = List.fold_left (@) [] lists
b. let k = List.map (fun x -> x > 10)
c. let g h x = h x |> not
d. let p f xs = (List.filter f xs, List.filter (g f) xs) < g from part (b) > *)

(* 4. Consider the library function val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list, where map2 f [a1; ...; an] [b1; ...; bn] is [f a1 b1; ...; f an bn]. Use map2 to write a function val zip: 'a list -> 'b list -> ('a * 'b) list, such that, e.g. zip [1;2;3] [4;5;6] yields [(1,4);(2,5);(3,6)]. The behaviour is only required for lists of equal length (undefined otherwise). *)

(* 5. Write a function val sumOfLargeSquares : int list -> int, that computes the sum of the squares of all list elements larger than 5, e.g. sumOfLargeSquares [3;4;5;6;7] yields 85. Do not use explicit recursion. *)

(* 6. The following functions are not tail-recursive. Transform them into an equivalent tail recursive versions
a. let rec factorial n = if n = 0 then 1 else n * factorial n
b. let rec reverse xs = if xs = [] then [] else (reverse xs) @ [x] *)

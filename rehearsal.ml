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

(* 3. For each of the following functions, describe what they do and provide a non-trivial, illustrative example of an application. *)

(* a. let c lists = List.fold_left (@) [] lists *)
The function c concatenates a list of lists into a single list. For example, c [[1;2]; [3;4]; [5;6]] returns the list [1; 2; 3; 4; 5; 6].

(* b. let k = List.map (fun x -> x > 10) *)
The function k takes a list of integers and returns a list of booleans indicating whether each integer is greater than 10. For example, k [1; 20; 3; 40] returns the list [false; true; false; true].

(* c. let g h x = h x |> not *)
The function g takes a boolean function h and a value x, and returns the negation of h x. For example, g (fun x -> x > 10) 5 returns true because 5 is not greater than 10, so the function returns the negation of false, which is true.

(* d. let p f xs = (List.filter f xs, List.filter (g f) xs) < g from part (c) > *)
The function p takes a boolean function f and a list xs, and returns a pair of two lists: the first list contains all the elements in xs that satisfy f, and the second list contains all the elements in xs that do not satisfy f. For example, p (fun x -> x > 10) [5; 20; 3; 40] returns the pair ([20; 40], [5; 3]), which means that the first list contains the values greater than 10 (20 and 40), and the second list contains the values less than or equal to 10 (5 and 3).

(* ######################################################### *)

(* 4. Consider the library function val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list, where map2 f [a1; ...; an] [b1; ...; bn] is [f a1 b1; ...; f an bn]. Use map2 to write a function val zip: 'a list -> 'b list -> ('a * 'b) list, such that, e.g. zip [1;2;3] [4;5;6] yields [(1,4);(2,5);(3,6)]. The behaviour is only required for lists of equal length (undefined otherwise). *)
let zip xs ys =
  let f x y = (x, y) in
  List.map2 f xs ys

The function zip takes two lists xs and ys, and applies the map2 function to them with the helper function f that takes two arguments x and y and returns a tuple (x, y). The result is a list of tuples that pair up the corresponding elements of xs and ys. Note that map2 guarantees that the resulting list will have the same length as xs and ys, so the behaviour is only defined if xs and ys are of equal length.

For example, zip [1;2;3] [4;5;6] returns the list [(1,4);(2,5);(3,6)].


(* ######################################################### *)

(* 5. Write a function val sumOfLargeSquares : int list -> int, that computes the sum of the squares of all list elements larger than 5, e.g. sumOfLargeSquares [3;4;5;6;7] yields 85. Do not use explicit recursion. *)

let sumOfLargeSquares xs =
  List.filter (fun x -> x > 5) xs
  |> List.map (fun x -> x * x)
  |> List.fold_left (+) 0

The function first filters the list xs to include only the elements greater than 5, using the List.filter function and a lambda function that takes an element x and returns a boolean indicating whether it is greater than 5.

Then, it maps (squares) the resulting list using the List.map function and a lambda function that takes an element x and returns its square x * x.
  
Finally, it reduces the resulting list to a single value - the sum of all its elements - using the List.fold_left function with the + operator and an initial value of 0. The resulting value is the sum of the squares of all the elements in xs that are greater than 5.
  
For example, sumOfLargeSquares [3;4;5;6;7] returns 85, which is the sum of the squares of the elements 6 and 7.

(* ######################################################### *)

(* 6. The following functions are not tail-recursive. Transform them into an equivalent tail recursive versions *)

(* a. let rec factorial n = if n = 0 then 1 else n * factorial n *)
let factorial n =
  let rec loop acc n =
    if n = 0 then acc
    else loop (acc * n) (n - 1)
  in
  loop 1 n

The tail-recursive version of factorial uses an inner function loop that takes two arguments: acc, which accumulates the factorial product, and n, which decrements from the input n down to 0. In each iteration, loop multiplies n by acc and decrements n by 1, until n reaches 0, at which point loop returns the accumulated factorial product.

(* b. let rec reverse xs = if xs = [] then [] else (reverse xs) @ [x] *)
let reverse xs =
  let rec loop acc = function
    | [] -> acc
    | x :: xs -> loop (x :: acc) xs
  in
  loop [] xs

The tail-recursive version of reverse uses an inner function loop that takes two arguments: acc, which accumulates the reversed list, and xs, which iteratively pops off the head of the input list and prepends it to acc until the input list is empty.

Note that in each iteration, loop prepends x to acc, rather than appending it as in the original reverse function. This is because prepending to a list is an O(1) operation, while appending is O(n) (where n is the length of the list), which makes the tail-recursive version more efficient. Finally, when the input list xs is empty, loop returns the accumulated reversed list acc.



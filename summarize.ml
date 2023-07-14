(* Chapter 1 : What is Ocaml *)

(* OCaml is a statically typed functional programming language. It stands for Objective Caml and is a dialect of the ML (Meta Language) family of languages. OCaml supports both functional and imperative programming paradigms, and it is known for its strong type inference, pattern matching, and support for algebraic data types. It is often used in the development of large-scale systems, compilers, and formal verification tool. *)

(* Chapter 2 : Basics *)

(* Top level *)

# 42;;
- : int = 42

(* 42 is the value.
int is the type of the value.
The value was not given a name, hence the symbol - *)

let x = 42
val x : int = 42

(* A value was bound to a name, hence the val keyword.
x is the name to which the value was bound.
int is the type of the value.
42 is the value. *)

let increment x = x + 1
val increment : int -> int = <fun>

(* increment is the identifier to which the value was bound.

int -> int is the type of the value. This is the type of functions that take an int as input and produce an int as output. Think of the arrow -> as a kind of visual metaphor for the transformation of one value into another value—which is what functions do.

The value is a function, which the toplevel chooses not to print (because it has now been compiled and has a representation in memory that isn’t easily amenable to pretty printing). Instead, the toplevel prints <fun>, which is just a placeholder. *)

(* Expressions *)

let age : int = 25;;
let pi : float = 3.14;; (* always use *. instead of * to calculate float *)
let firstChar : char = 'a';;
let greeting : string = "Hello, World!";;
let isTrue : bool = true;;
let nothing : unit = ();;

string_of_int 42
int_of_string "123"
"abc".[0]

(* Comparison *)

 =, <>, >, < (* Comparing Values *)

==, != (* Comparing Physically *)

(* Assertion *)

let divide x y =
  assert (y <> 0);  (* Assert that y is not equal to 0 *)
  x / y

(* If else then *)

let x = 10 in
if x > 15 then
  print_endline "x is greater than 15"
else if x > 5 then
  print_endline "x is greater than 5 but not greater than 15"
else
  print_endline "x is not greater than 5"

(* Let *)
let x = 42;;
let x = 42 in x + 1
(let x = 42) + 1
(let x = 42 in x) + 1

(* Function *)
let f x = ...
let rec f x = ...
let rec fact n = if n = 0 then 1 else n * fact (n - 1)
let rec pow (x : int) (y : int) : int = ...

let inc x = x + 1
let inc = fun x -> x + 1

(* Pipeline *)
5 |> inc |> square |> inc |> inc |> square;;
square (inc (inc (square (inc 5))));;

(* Create new operator *)
let ( ^^ ) x y = max x y
And now 2 ^^ 3 evaluates to 3.

(* Printing *)
print_endline "Camels are bae"
- : unit = ()
print_string
print_int
print_float
print_char


(* 
let rec log_taylor (x:float) (n:int) :float = 
	if n = 1 then x
	else 
		let sign = if (n mod 2) = 0 then -1. else 1. in 
		(* this is more efficient in calculating sign than using (-1.)**(float (n+1)) *)
		let powx = x ** (float n) in
		(sign *. powx /. (float n)) +. log_taylor (x) (n-1);;

let result = log_taylor 3.0 2;;
Printf.printf "The natural logarithm of %.2f is approximately %.2f\n" 3.0 result;; *)


let rec last = function 
  | [] -> None
  | [ x ] -> x
  | _ :: t -> last t;;

let a = [1;2;3;4] ;;
let result = last (a);;
print_int (Option.get result);;
(* Exercise: values [★] *)
let (_ : int) = 7 * (1 + 2 + 3)
let (_ : string) = "CS " ^ string_of_int 3110

(* Exercise: operators [★★] *)
let (_ : int) = 42 * 10
let (_ : float) = 3.14 /. 2.0
let _ = 4.2 ** 7.

(* Exercise: equality [★] *)

let _ = 42 = 42
let _ = "hi" = "hi"
let _ = "hi" == "hi"

(* Exercise: assert [★] *)

let _ = assert (not (2110 = 3110))
let _ = assert (2110 <> 3110)

(* Exercise: if [★] *)
(* Write an if expression that evaluates to 42 if 2 is greater than 1 and otherwise evaluates to 7. *)
let _ = if 2 > 1 then 42 else 7

(* Exercise: double fun [★] *)
let double input = input * 2

(* Exercise: more fun [★★] *)
let cube x = x *. x *. x
let sign x = if x > 0 then 1 else if x < 0 then -1 else 0
let area r = Float.pi *. (r ** 2.)

(* Exercise: RMS [★★] *)

let rms x y = sqrt (((x *. x) +. (y *. y)) /. 2.)

(* Exercise: date fun [★★★] *)

let valid_date d m =
  if
    m = "Jan" || m = "Mar" || m = "May" || m = "Jul" || m = "Aug" || m = "Oct"
    || m = "Dec"
  then 1 <= d && d <= 31
  else if m = "Apr" || m = "Jun" || m = "Sept" || m = "Nov" then
    1 <= d && d <= 30
  else if m = "Feb" then 1 <= d && d <= 28
  else false

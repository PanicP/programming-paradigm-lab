(* Exercise: take drop tail [★★★★] *)

(* Exercise: unimodal [★★★] *)

(** returns: whether the input list is monotonically decreasing *)
let rec is_mon_dec = function
  | [] | [ _ ] -> true
  | h1 :: (h2 :: t2 as t) -> h1 >= h2 && is_mon_dec t

(** returns: whether the input list is monotonically increasing
    then monotonically decreasing *)
let rec is_mon_inc_then_dec = function
  | [] | [ _ ] -> true
  | h1 :: (h2 :: t2 as t) as lst ->
      if h1 <= h2 then is_mon_inc_then_dec t else is_mon_dec lst

let is_unimodal lst = is_mon_inc_then_dec lst

(* Exercise: safe hd and tl [★★] *)

(* returns: [Some x] if the head of [lst] is [x], or [None]
 *   if [lst] is empty.
 *)
let safe_hd = function [] -> None | h :: _ -> Some h

(* returns: [Some x] if the tail of [lst] is [x], or [None]
 *   if [lst] is empty.
 *)
let safe_tl = function [] -> None | _ :: t -> Some t

(* Exercise: quadrant [★★] *)

type quad = I | II | III | IV
type sign = Neg | Zero | Pos

(** [sign x] is [Zero] if [x = 0]; [Pos] if [x > 0]; and [Neg] if [x < 0]. *)
let sign x = if x = 0 then Zero else if x > 0 then Pos else Neg

(** [quadrant (x,y)] is [Some q] if [(x, y)] lies in quadrant [q], or [None] if
    it lies on an axis. *)
let quadrant (x, y) =
  match (sign x, sign y) with
  | Pos, Pos -> Some I
  | Neg, Pos -> Some II
  | Neg, Neg -> Some III
  | Pos, Neg -> Some IV
  | _ -> None

(* Exercise: depth [★★] *)

type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree

(** [depth t] is the number of nodes in any longest path from the root to a 
    leaf in tree [t]. *)
let rec depth = function
  | Leaf -> 0
  | Node (_, left, right) -> 1 + max (depth left) (depth right)

(* Exercise: shape [★★★] *)

(** [same_shape t1 t2] is [true] if and only if [t1] and [t2] have the same
    shape. *)
let rec same_shape t1 t2 =
  match (t1, t2) with
  | Leaf, Leaf -> true
  | Node (_, l1, r1), Node (_, l2, r2) -> same_shape l1 l2 && same_shape r1 r2
  | _ -> false

(* Exercise: is_bst [★★★★] *)

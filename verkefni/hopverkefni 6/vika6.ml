(*
include "C:/Users/Snorri Agnarsson/hivefur/TOL304G-24/vika6.ml";;
*)

(*
** Notkun: map f x
** Fyrir:  x er 'a list = [x1;x2;...;xN], f er 'a->'b
** Gildi:  listinn [f x1;f x2;...;f xN]

** Usage:  map f x
** Pre:    x er 'a list = [x1;x2;...;xN], f is 'a->'b
** Value:  The list [f x1;f x2;...;f xN]
*)
let rec map f x =
  if x = [] then
    []
  else
    (f (hd x)) :: (map f (tl x))
;;

(*
** Notkun: reverse x
** Fyrir:  x er listi [x1;x2;...;xN]
** Gildi:  Listi sömu gilda og x inniheldur,
**         en í viðsnúinni röð, þ.e.
**         [xN;...;x2;x1]

** Usage:  reverse x
** Pre:    x is a list [x1;x2;...;xN]
** Value:  A list of the same values that x
**         contains, but in the reverse order
**         i.e. [xN;...;x2;x1]
*)
let reverse x =
  (*
  ** Notkun: revapp x y
  ** Fyrir:  x er listi [x1;x2;...;xN]
  **         y er listi [y1;y2;...;yM]
  **         gilda af sama tagi og x
  ** Gildi:  Listi sömu gilda og x inniheldur,
  **         en í viðsnúinni röð, með y
  **         viðskeytt, þ.e.
  **         [xN;...;x2;x1;y1;y2;...;yM]

  ** Usage:  revapp x y
  ** Pre:    x is a list [x1;x2;...;xN]
  **         y is a list [y1;y2;...;yM]
  **         of values of the same type as x
  ** Value:  A list of the values in x, in the
  **         reverse order, with y appended, i.e.
  **         [xN;...;x2;x1;y1;y2;...;yM]
  *)
  let rec revapp x y =
    if x = [] then
      y
    else
      revapp (tl x) ((hd x) :: y)
  in
    revapp x []
;;

(*
** Notkun: append x y
** Fyrir:  x er listi [x1;x2;...;xN]
**         y er listi [y1;y2;...;yM]
**         gilda af sama tagi og x
** Gildi:  Listi sömu gilda og x inniheldur,
**         með y viðskeytt, þ.e.
**         [x1;x2;...;xN;y1;y2;...;yM]

** Usage:  append x y
** Pre:    x is a list [x1;x2;...;xN]
**         y is a list [y1;y2;...;yM]
**         of values of the same type as x
** Value:  A list of the same values as x
**         contains, with y appended, i.e.
**         [x1;x2;...;xN;y1;y2;...;yM]
*)
let rec append x y =
  if x=[] then
    y
  else
    (hd x) :: (append (tl x) y)
;;

(*
** Notkun: y f
** Fyrir:  f er fall sem tekur lélegt fall af
**         tagi 'a -> 'b sem viðfang og skilar
**         betra falli af sama tagi
** Gildi:  Besta fall 'a -> 'b sem unnt er að
**         fá með því að endurbæta gagnslaust
**         fall með f

** Usage:  y f
** Pre:    f is a function that takes bad function
**         of type 'a -> 'b as an argument and returns
**         a better function of the same type
** Value:  The best function 'a -> 'b that can be
**         gotten by improving a useless function
**         with f
*)
let rec y f x =
  (f (y f)) x
;;

(*
** Notkun: bfact f
** Fyrir:  f er fall af tagi int->float
**         þ.a. til er einhver heiltala m>=0
**         þ.a. fyrir öll n með 0<=n<m skilar
**         (f n) gildinu n!.
** Gildi:  fall g þ.a. fyrir öll n með 0<=n<=m
**         skilar (g n) gildinu n!.

** Usage:  bfact f
** Pre:    f is a function of type int->float
**         such that there exists some integer
**         m>=0 such that, for all n such that
**         0<=n<m, (f n) returns the value n!.
** Gildi:  A function g such that for all n
**         with 0<=n<=m the call (g n) returns
**         the value n!.
*)
let bfact f n =
  if n = 0 then
    1.0
  else
    (float_of_int n) *. f(n-1)
;;

(y bfact) 10;;

let bfact2 f n =
  if n = 0 then
    1.0
  else
    (float_of_int n) *. f(n-1)
in
  (y bfact2) 10
;;

(*
Usage: multi n f x
Pre:   n is an int, n>=0,
       f is of type A->A,
       x is of type A
Value: f(f(...f(x))) where f is
       applied n times
*)
let rec multi n f x =
  if n==0 then
    x
  else
    multi (n-1) f (f x)
;;

(*
Usage: bsqrt x y
Pre:   y is an approximation to sqrt(x),
       x > 0.0, y > 0.0
Value: y if y is a good approximation,
       otherwise a better approximation.
*)
let bsqrt x y =
  if abs_float(x /. y /. y -. 1.0) < 1.9E-14 then
    y
  else
    (y +. x /. y) /. 2.0
;;

"sqrt(10.0)";;
(multi 20 (bsqrt 10.0)) 1.0;;

"99!";;
(multi 100 bfact) (fun n->raise (Invalid_argument "Bad argument")) 99;;

(*
Usage: bisect f (a,b)
Pre:   f is of type float->float,
       a and b are of type float,
       f is a continuous function
       on the interval [a,b],
       a <= b, (f a)*.(f b) <= 0.0
Value: (x,y), where x and y are
       of type float,
       x <= y, (f x)*.(f y) <= 0.0,
       y-.x is half of b-.a.
	   [x,y] is a subinterval of [a,b]
*)
let bisect f (a,b) =
  let
    m = (a +. b) /. 2.0
  in
    if (f a)*.(f m) <= 0.0 then
      (a,m)
    else
      (m,b)
;;

(multi 30 (bisect (fun x->x*.x-.2.0))) (0.0,2.0);;

(*
Usage: bfibo f
Pre:   f is a Fibonacci function that works for
       arguments <k for some int k
Value: A Fibonacci funtion that works for arguments
       <k+1
*)
let bfibo f n =
  if n<2 then
    n
  else
    f(n-1)+f(n-2)
;;

"10th Fibonacci number";;
(multi 10 bfibo) (fun n->raise (Invalid_argument "Bad argument")) 10;;

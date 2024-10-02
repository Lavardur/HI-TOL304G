;; Use: (myfoldl f u x)
;; Pre: f is a binary funtion, i.e. a function
;;      that takes two arguments of some type,
;;      x=(x1 ... xN) is a list of values of
;;      that type, u is a value of that type.
;; Value: (f (f ...(f (f u x1) x2) ...) xN)
;; Note: In other words, if we define a binary
;;       operation ! with a!b = (f a b), then
;;       then the value returned is the value of
;;       u ! x1 ! x2 | ... ! xN
;;       where we compute from left to right
(define(myfoldl f u x)
  (if(null? x)
     u
  (myfoldl f (f u (car x)) (cdr x)))
)


(myfoldl + 0 (myiota 30))

(myfoldl * 1 (myiota 30))
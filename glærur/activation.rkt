;; Usage: (f x)
;; Pre:   x is a number
;; Value: 2*x+1
(define (f x)
  ;; Usage: ((g y) z)
  ;; Pre:   y and z are
  ;;        numbers
  ;; Value: x+y+z
  (define (g y)
    ;; Usage: (h z)
    ;; Pre:   z is a number
    ;; Value: x+y+z
    (define (h z)
      (+ x y z)
    )
    h
  )
  (+ 0 ((g 1) x))
)

(f 2)

;; Usage: ((adder a) b)
;; Pre:   a and b are numbers
;; Value: a+b
(define (adder a)
  (lambda (b) (+ a b))
)

((adder 10) 20)

;; Usage: (root f a b eps)
;; Pre:   f is a function that takes one
;;        floating point argument and is a
;;        continuous function R->R.
;;        a, b and eps are floating point
;;        numbers, a<b, eps>0.0 and the
;;        product (* (f a) (f b)) is
;;        <= 0.0.
;; Value: A floating point number x such
;;        that a <= x <= b and there
;;        exists a z in [a,b] such that
;;        (f z)==0 and |x-z| < eps.
(define (root f a b eps)
  (let ((x (/ (+ a b) 2.0)))
    (if (< (- b x) eps)
        x
        (if (<= (* (f a) (f x)) 0.0)
            (root f a x eps)
            (root f x b eps)
        )
    )
  )
)

(root (lambda (z) (- (* z z) 2.0)) 1.0 2.0 1.0E-10)

;; Usage: ((rooter c) x)
;; Pre:   x and c are floating point numbers.
;; Value: x*x-c
(define ((rooter c) x)
  (- (* x x) c)
)

(root (rooter 2.0) 1.0 2.0 1.0E-10)
(root (rooter 2.0) 1.0 2.0 1.0E-15)
(let ((r (root (rooter 2.0) 1.0 2.0 1.0E-15))) (* r r))
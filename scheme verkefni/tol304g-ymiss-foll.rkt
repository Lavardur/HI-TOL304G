;;; Möguleg föll og lykilorð
;;;  define, lambda, if, and, or, car, cdr, cons, null?, list, =, *, +.

; Notkun (f n)
; Fyrir: n er heiltala, n >=0
; Gildi: n!

(define (f n) (if (< n 2) 1 (* n (f (- n 1)))))

"(f 10)"
(f 10)

; Notkun: (len x)
; Fyrir: x er listi
; Gildi: lengd listans x

(define (len x)
  (if (null? x)
      0
      (+ 1 (len (cdr x)))
  )
)

"(len '(1 2 3))"
(len '(1 2 3))
"(len ' ())"
(len ' ())

(define x 123)
(define f2 (lambda (n) (if (< n 2) 1 (* n (f2 (- n 1))))))

;; Finna hausinn á lista
;; CAR - Contents, Adress, Register
"(car ' (1 2 3))"
(car ' (1 2 3))

(define z '(1 2 3))
"(define z '(1 2 3))"
z

"(car z)"
(car z)
"(cadr z)"
(cadr z)
;; Notkun: (last x)
;; Fyrir: x=(x1 x2 ... xN) er listi, ekki tómur.
;; Gildi: xN, þ.e. aftasta gildi x.

(define (last x)
  (if (null? (cdr x))
      (car x)
      (last (cdr x))
  )
)
(define z '(1 2 3))
(last z)

;; Notkun: (remove-last x)
;; Fyrir: x=(x1 x2 ... xN) er listi, ekki tómur.
;; Gildi: (x1 x2 ... xN-1), þ.e. listi allra
;; gilda í x fyrir utan aftasta.

(define (remove-last x)
  (if (null? (cdr x))
      '()
      (cons (car x) (remove-last (cdr x)))
  )
)
(remove-last z)

;; Notkun: (product x)
;; Fyrir: x=(x1 x2 ... xN) er listi talna.
;; Gildi: Talan x1*x2*...*xN.

(define (product x)
  (define (product-helper x sum)
    (if (null? x)
        sum
        (product-helper (cdr x) (* sum (car x)))))
  (product-helper x 1))

(product '())

;; Notkun: (myappend x y)
    ;; Fyrir:  x=(x1 x2 ... xN) er listi,
    ;;         y=(y1 y2 ... yM) er einnig listi.
    ;; Gildi:  Listinn (x1 x2 ... xN y1 y2 ... yM).
(define (myappend x y)
  (if (null? x)
    '()
    (cons (car x) (remove-last (cdr x)))
  )
)


(define a '(1 2 3))
(define b '(4 5 6))

(remove-last a)
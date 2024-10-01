(define u 10)
(define (f x)
  (lambda (y)
    (lambda (z)
      (+ u x y z)
    )
  )
)
u
f
(define g (f 20))
g
(define h (g 30))
h
(h 40)

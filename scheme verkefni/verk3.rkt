(define lambda-1
  (lambda (x)
    (lambda (y)
      (/ (+ x y)y)
    )
  )
)  

((lambda-1 3)5)


(((lambda (x)(lambda (y)(/ (+ x y) y)))3)6)


(((lambda (x) (lambda (y) (x(x y))))(lambda(x) (* x x)))3)

(lambda (x)
  (lambda (y)
    (lambda (z)
      (x (y (y z))))))

(define lambda-2 (lambda (x) (/ (+ x z) z)))

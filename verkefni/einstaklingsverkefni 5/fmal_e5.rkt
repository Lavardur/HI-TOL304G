;; Notkun: (realpow-recursive x z)
;; Fyrir: x er rauntala (floating-point number) og z er heiltala (positive integer).
;; Gildi: Gildið sem skilið er er rauntala sem er x í veldi z, þ.e. x^z.
;; 
;; Fallið notar endurkvæma aðferð til að reikna x^z með því að nýta eiginleika veldis:
;; 1. Þegar z er 0, skilar fallið 1 (x^0 = 1).
;; 2. Ef z er slétt, skilar fallið (x^(z/2))^2, sem dregur dýpt endurkvæmni niður í log2(z).
;; 3. Ef z er oddatala, skilar fallið x * (x^(z-1)).
;; 
;; Fallið tryggir að dýpt endurkvæmni sé í hlutfalli við log2(z), sem gerir það árangursríkt
;; fyrir stórar tölur z. Öll skilyrði fyrir virkni eru uppfyllt án þess að bæta þurfi við
;; forskilyrðum eða eftirskilyrðum.
(define (realpow-recursive x z)
  (cond
    ((= z 0) 1)
    ((= z 1) x)
    ((even? z) (let ((half (realpow-recursive x (quotient z 2))))
                 (* half half)))
    (else (* x (realpow-recursive x (- z 1))))))

(define test-base (+ 1 1e-10))
(define test-exponent 10000000000)

;(realpow-recursive test-base test-exponent)

;; Notkun: (transpose-list z)
;; Fyrir: z er listi jafnlangra lista,
;; z=((x11 x12 ... x1N)
;; (x21 x22 ... x2N)
;; (x31 x32 ... x3N)
;; .
;; .
;; .
;; (xM1 xM2 ... xMN)
;; )
;; Gildi: Listinn sem er byltingin
;; (transpose) af z, þ.e.
;; ((x11 x21 ... xM1)
;; (x12 x22 ... xM2)
;; (x13 x23 ... xM3)
;; .
;; .
;; .
;; (x1N x2N ... xMN)
;; )
(define (transpose-list z)
  (if (null? (car z)) '()  
      (cons (map car z)
            (transpose-list (map cdr z)))))  
(define test-list '((1 2 3) (4 5 6) (7 8 9)))

(transpose-list test-list)

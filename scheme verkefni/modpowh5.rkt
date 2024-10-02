;; Use: (modpow p q r)
;; Pre: p,q and r are integers, q >= 0, 0 <= p < r and r > 1
;; Value: The remainder when r is divided into p to the power q
(define (modpow p q r)
  ;; Use: (help n acc total)
  ;; Pre: n, acc, and total are integers, acc >= 0
  ;; Value: The remainder when r is divided into n raised to the power of acc,
  ;;        accumulated with the current total
  (define (help n acc total)
    (if (= acc 0)
        (remainder total r)
        (if (= 0 (remainder acc 2))
            (help (remainder (* n n) r) (/ acc 2) total)
            (help n (- acc 1) (remainder (* total n) r)))))
  (help p q 1))

(modpow 123 1234567890 12345678901)
(modpow 2 10 10000)

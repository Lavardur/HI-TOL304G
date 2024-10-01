<script type="text/javascript" 
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });
</script>

# TÖL304G
## Forritunarmál - Verkefnablað 3

---

1. $λx.(λy.(x + y) /y)$

```
(lambda (x)(lambda (y)(/(+ x y)y))
```

Fyrir $x=3$ og $y=5$ skilar fallið gildinu $1\frac{3}{5}$

Endurskrifuð segð:

```
(lambda (a)(lambda (b)(/(+ a b)b))
```

eða

$$
(\lambda (a) (\lambda (b) \frac{a + b}{b}))
$$


---

2. $((λx.(λy.(x + y) /y)) 3) 6$
```
(((lambda (x)(lambda (y)(/(+ x y)y)))3)6)
```

Fallið skilar gildinu $1\frac{1}{2}$

Endurskrifuð segð:
```
(((lambda (a)(lambda (b)(/(+ a b)b)))3)6)
```

eða

$$
(((\lambda (a)(\lambda (b)(/(+ a b) b))) 3) 6)
$$



---

3. $((λx.(λy.(x(xy)))) (λx.x2))3$
```
(((lambda (x) (lambda (y) (x(x y))))(lambda(x) (* x x)))3)
```

Fallið skilar gildinu $81$

Endurskrifuð segð:

```
(((lambda (a) (lambda (b) (a(a b))))(lambda(a) (* a a)))3)
```

eða

$$
(((\lambda (a) (\lambda (b) (a (a b)))) (\lambda (a) (* a a))) 3)
$$
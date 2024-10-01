<script type="text/javascript" 
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });
</script>

# Einstaklingsverkefni

Íhugið eftirfarandi λ-segðir.
- Skrifið Scheme segðir (mega vera Scheme föll) sem jafngilda þeim. Athugið að
í λ-reikningi merkir segð xy fallið x beitt á viðfang y, ekki x margfaldað með y.

- Ef segðin skilar einföldu gildi (t.d. tölu) skal tiltaka hvert gildið er.

- Ef segðin skilar falli sýnið þá, ef hægt er, hvernig nota má fallið í segð sem
skilar einföldu gildi og tiltakið hvaða gildi er útkoman.

- Tiltakið hvaða breytur eru frjálsar í hverri segð (ef einhver er). Athugið að
hér er spurt um hvort breytan er frjáls í heildarsegðinni, ekki aðeins einhverri
undirsegð.

- Endurskrifið einnig λ-segðina og skiptið um breytunöfn þar sem það er hægt
án þess að merking hennar breytist og notið breytunöfn a, b, o.s.frv. í stað x, y
o.s.frv.

Athugið að hér erum við að nota smá viðbætur við venjulegan λ-reikning, sem eru
nokkuð hefðbundnar þó. Við leyfum okkur t.d. að skrifa x+y og ætlumst til að segðin
5 + 3 sé umrituð í segðina 8 ef sá möguleiki kemur upp.

1. $λx.((x + z) /z)$

Scheme fall:

```
(lambda (x) (/ (+ x z) z))
```
z er frjáls breyta og þarf að vera skilgreind fyrir notkun segðarinnar

Endurskrifað:

```
(lambda (a) (/ (+ a b) b))
```

eða

$$λa.(λb.(λc.a(b(bc))))$$

---

2. $λx.(λy.(λz.x(y (yz))))$

Scheme fall:

```
(lambda (x) (lambda (y) (lambda (z) (x (y (y z))))))
```
Endurskrifað:

```
(lambda (a) (lambda (b) (lambda (c) (a (b (b c))))))
```

eða

$$λa.(λb.(λc.a(b(bc))))$$
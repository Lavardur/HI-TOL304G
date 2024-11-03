# TÖL304G Forritunarmál Verkefnablað 10
# Einstaklingsverkefni 10

```
module Main (main) where

-- Notkun: listAll i n f
-- Fyrir:  tvær heiltölur i og n og fall f
-- Gildi: listi af gildum f(i), f(i+1), ..., f(n)

listAll :: Int -> Int -> (Int -> a) -> [a] 
listAll i n f = map f [i..n]

-- Notkun: powerList n
-- Fyrir:  heiltala n
-- Gildi: listi af listum sem eru allir mögulegir hlutlistar listans [1,2,...,n]

powerList :: Int -> [[Int]]
powerList n = foldr (\x acc -> acc ++ map (x:) acc) [[]] [1..n]



main :: IO ()
main = do
    print (listAll 1 5 (\x -> x * x) :: [Int])
    print (powerList 3)

```
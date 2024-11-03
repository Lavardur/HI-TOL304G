module Main (main) where

-- Write a function listAll in Haskell that takes arguments i, n and f 
-- and returns the list [f(i),f(i+1),...,f(n)].

-- Notkun: listAll i n f
-- Fyrir:  tvær heiltölur i og n og fall f
-- Gildi: listi af gildum f(i), f(i+1), ..., f(n)

listAll :: Int -> Int -> (Int -> a) -> [a] 
listAll i n f = map f [i..n]

{- Write a Haskell function powerList that takes an integer n as argument
and returns a list of integer lists that are all the possible sublists of the list
[1,2,...,n]. This should be the powerlist of [1,2,...,n] as discus-
sed for other assignments. -}

-- Notkun: powerList n
-- Fyrir:  heiltala n
-- Gildi: listi af listum sem eru allir mögulegir hlutlistar listans [1,2,...,n]

powerList :: Int -> [[Int]]
powerList n = foldr (\x acc -> acc ++ map (x:) acc) [[]] [1..n]



main :: IO ()
main = do
    print (listAll 1 5 (\x -> x * x) :: [Int])
    print (powerList 3)

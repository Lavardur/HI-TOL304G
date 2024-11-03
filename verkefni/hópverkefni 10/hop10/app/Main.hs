module Main (main) where

-- Notkun: reversedlistOfLists [x1, x2, ..., xn]
-- Fyrir:  listi af tölum
-- Gildi: listi af listum þar sem hvert stak í inntakslistanum er í sér lista í öfugri röð.

reversedListOfLists :: [a] -> [[a]]
reversedListOfLists xs = foldl (\acc x -> [x] : acc) [] xs

-- Notkun: productOfSums [[x11, x12, ..., x1n], [x21, x22, ..., x2n], ..., [xm1, xm2, ..., xmn]]
-- Fyrir:  listi af listum af fleytitölum
-- Gildi: margfeldi summa allra talna í listunum í inntakslistanum

productOfSums :: [[Float]] -> Float 
productOfSums = foldr (\x acc -> (foldr (+) 0 x) * acc) 1.0


-- Write a function listAll in Haskell that takes arguments i, n and f 
-- and returns the list [f(i),f(i+1),...,f(n)].

-- Notkun: listAll i n f
-- Fyrir:  tvær heiltölur i og n og fall f
-- Gildi: listi af gildum f(i), f(i+1), ..., f(n)

listAll :: Int -> Int -> (Int -> a) -> [a] 
listAll i n f = map f [i..n]




main :: IO ()
main = do
    print (reversedListOfLists [1, 2, 3, 4] :: [[Int]])
    print (productOfSums [[1.0, 2.0], [3.0], [4.0, 5.0]])
    print (listAll 1 5 (\x -> x * x))

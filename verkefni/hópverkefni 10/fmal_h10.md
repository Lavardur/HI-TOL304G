# TÖL304G Forritunarmál Verkefnablað 10
## Hópverkefni 10

Notast var við Haskell tool stack til þess að keyra forritið í VScode.

![alt text](<Screenshot 2024-10-31 at 15.23.47.png>)

```
module Main (main) where

-- Notkun: reversedListOfLists [x1, x2, ..., xn]
-- Fyrir:  listi af tölum
-- Gildi: listi af listum þar sem hvert stak í inntakslistanum er í sér lista í öfugri röð.

reversedListOfLists :: [a] -> [[a]]
reversedListOfLists xs = foldl (\acc x -> [x] : acc) [] xs

-- Notkun: productOfSums [[x11, x12, ..., x1n], [x21, x22, ..., x2n], ..., [xm1, xm2, ..., xmn]]
-- Fyrir:  listi af listum af fleytitölum
-- Gildi: margfeldi summa allra talna í listunum í inntakslistanum

productOfSums :: [[Float]] -> Float 
productOfSums = foldr (\x acc -> (foldr (+) 0 x) * acc) 1.0

main :: IO ()
main = do
    print (reversedListOfLists [1, 2, 3, 4] :: [[Int]])
    print (productOfSums [[1.0, 2.0], [3.0], [4.0, 5.0]])  

```
import Control.Monad

myMap1 :: (a->b)->[a]->[b]
myMap1 f x = [ f z | z <- x ]

myMap2 :: (Monad m) => (a->b)->m a->m b
myMap2 f x = do { z <- x; return (f z) }

myMap3 :: (a->b)->[a]->[b]
myMap3 f x = do { z <- x; [f z] }

myMap4 :: (a->b)->[a]->[b]
myMap4 _ [] = []
myMap4 f (x:xs) = (f x):(myMap4 f xs)

myMap5 :: (a->b)->[a]->[b]
myMap5 f x = if null x then [] else (f(head x)):(myMap5 f (tail x))

myMap6 :: (Monad m) => (a->b)->m a->m b
myMap6 f x = x >>= \z -> return(f z)

myMap7 :: (a->b)->[a]->[b]
myMap7 f x = concatMap (\z -> [f z]) x

myMap8 :: (a->b)->[a]->[b]
myMap8 f x = x >>= \z -> [f z]

myMap9 :: (Foldable m) => (a->b)->m a->[b]
myMap9 f x = foldr (\a b -> (f a):b) [] x

myMap10 :: (Foldable m) => (a->b)->m a->[b]
myMap10 f x = reverse (foldl (\a b -> (f b):a) [] x)

myFilter1 :: (a->Bool)->[a]->[a]
myFilter1 p x = [ z | z <- x, p z ]

myFilter2 :: (a->Bool)->[a]->[a]
myFilter2 p x = do { z <- x; if p z then [z] else [] }

myFilter3 :: (MonadPlus m) => (a->Bool)->m a->m a
myFilter3 p x = do { z <- x; if p z then return z else mzero }

myFilter4 :: (MonadPlus m) => (a->Bool)->m a->m a
myFilter4 p x = x >>= \z -> if p z then return z else mzero

myFilter5 :: (a->Bool)->[a]->[a]
myFilter5 p x = concatMap (\z -> if p z then [z] else []) x

myFilter6 :: (a->Bool)->[a]->[a]
myFilter6 p x = x >>= \z -> if p z then [z] else []

myFilter7 :: (a->Bool)->[a]->[a]
myFilter7 p x = foldr (\a b -> if p a then [a]++b else b) [] x

myFilter8 :: (a->Bool)->[a]->[a]
myFilter8 p x = foldl (\a b -> if p b then a++[b] else a) [] x

myFilter9 :: (a->Bool)->[a]->[a]
myFilter9 p x = reverse (foldl (\a b -> if p b then b:a else a) [] x)

main :: IO ()
main =
  do
    print (myMap1 (^2) [1..5])
    print (myMap2 (^2) [1..5])
    print (myMap3 (^2) [1..5])
    print (myMap4 (^2) [1..5])
    print (myMap5 (^2) [1..5])
    print (myMap6 (^2) [1..5])
    print (myMap7 (^2) [1..5])
    print (myMap8 (^2) [1..5])
    print (myMap9 (^2) [1..5])
    print (myMap10 (^2) [1..5])
    print (myMap2 (^2) (Just 10))
    print (myMap6 (^2) (Just 10))
    print (myMap2 (^2) Nothing)
    print (myMap6 (^2) Nothing)
    print (myFilter1 odd [1..10])
    print (myFilter2 odd [1..10])
    print (myFilter3 odd [1..10])
    print (myFilter4 odd [1..10])
    print (myFilter5 odd [1..10])
    print (myFilter6 odd [1..10])
    print (myFilter7 odd [1..10])
    print (myFilter8 odd [1..10])
    print (myFilter9 odd [1..10])
    print (myFilter3 odd (Just 10))
    print (myFilter4 odd (Just 10))
    print (myFilter3 odd (Just 11))
    print (myFilter4 odd (Just 11))
data Tree = None |
            Node [Tree]

base :: Int
base = fromEnum 'a'

next :: Tree -> Char -> Tree
next None _ = None
next (Node children) queryChar =
    children !! (fromEnum queryChar - base)

resolveQuery :: Tree -> String -> Tree
resolveQuery None _ = None
resolveQuery root query =
    foldl next root query

main :: IO ()
main = iteration None

iteration :: Tree -> IO ()
iteration tree =
    do
        query <- getLine
        if query == "/quit"
        then return ()
        else do
            print ["omega", "gamma", "delta"]
            iteration tree

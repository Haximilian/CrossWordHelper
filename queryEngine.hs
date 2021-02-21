data Tree = None

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

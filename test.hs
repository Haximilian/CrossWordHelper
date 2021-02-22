import Data.Char

createDictionary = do
    contents <- readFile "./words.txt"
    let words = lines contents
    return ((map.map) toLower words)

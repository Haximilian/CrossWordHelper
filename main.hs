import System.IO 
import Data.Char

-- 
-- createDictionary 
-- @Implementation 	Creates the dictionary list of all the words from words.txt
-- @Returns 		A List of strings with all the words
-- 

createDictionary :: String -> IO [String]
createDictionary path = 
    do
        contents <- readFile path
        let words = lines contents
        return (map $ toLower words)

    
-- 
-- checkWord
-- @Implementation	_
-- @Returns			_
-- 
checkWord word pattern = lengthMatch && wordMatch
    where
        lengthMatch = (length word == length pattern)
        wordMatch = foldr (\(w, p) acc -> ((w == p) || (w == '?')) && acc) True $ zip word pattern

main = 
    do
        dictionary <- createDictionary "./words.txt"
        mainProgram dictionary

mainProgram :: [String] -> IO ()
mainProgram dictionary =
    do
    	-- 1. Prompt for user input
        print "Welcome to UBC CrossWordHelper. To find answers to your crossword, please enter in a keyword. Use the '?' question-mark for any character."
        -- 2. Get user input
        query <- getLine
        -- 3a. If command was quit, exit program.
        if query == "/quit"
        then return ()
        -- 3b. Else check word
        else do
            let outputList = filter (\word -> checkWord word query) dictionary
            print ("Here are your words for " ++ query ++ ":")
            print outputList
            mainProgram dictionary






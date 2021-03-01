import System.IO ( hSetBuffering, stdin, BufferMode(LineBuffering) )
import Data.Char ( isSpace, toLower )

-- 
-- createDictionary 
-- @Implementation 	
--      Creates the dictionary list of all the words from words.txt
-- 
-- @Returns 		
--      A List of strings with all the words
-- 

createDictionary :: String -> IO [String]
createDictionary path =
    do
        contents <- readFile path
        let words = lines contents
        return (map (map toLower) words)


-- 
-- asteriskMatch
-- 
-- @Implementation
--      Checks if given word matches given pattern.
--      '?' matches any single letter.
--      '*' matches any variable number of letters.
-- 
-- @Returns
--      Boolean representing whether word and pattern match
-- 

asteriskMatch :: String -> String -> Bool
asteriskMatch [] []                      = True
asteriskMatch [] word                    = False
asteriskMatch "*" []                     = True
asteriskMatch _ []                       = False
asteriskMatch (p:rPattern) (w:rWord)     =
    if p == '*'
    then (asteriskMatch rPattern $ w:rWord) || (asteriskMatch (p:rPattern) rWord)
    else (p == w || p == '?') && asteriskMatch rPattern rWord


-- 
-- trim
-- From (https://en.m.wikipedia.org/wiki/Trim_(programming)#Haskell)
-- 

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace


-- 
-- main
-- 
-- @Implementation
--      Calls the mainProgram, which is the CrossWordHelper program
-- 

main :: IO ()
main =
    do
        dictionary <- createDictionary "./backup.txt"
        mainProgram dictionary


-- 
-- mainProgram
-- 
-- @Implementation
--      Presents the user with instructions on how to use the CrosswordHelper.
--      Takes user input, parses and trims the string
--      Calls asteriskMatch to look for potential matching words.
--      Outputs the results to the console and re-runs the program from start.
-- 

mainProgram :: [String] -> IO ()
mainProgram dictionary =
    do
        hSetBuffering stdin LineBuffering

        -- Introduce user to program with instructions
        -- Prompt user for input string
        putStrLn "Welcome to UBC CrossWordHelper. To find answers to your crossword, please enter in a keyword. Use the '?' question-mark for any character. Type '/quit' to quit the program."

        -- Receive and store user input from World
        query <- getLine
        putStrLn ""
        
        -- Parse user input by triming the empty space in the front and back
        let userInputString = trim query

        -- If command was quit, exit program.
        if userInputString == "/quit"
        then return ()
        -- Else, call asteriskMatch for computed results
        else do
            let outputList = filter (asteriskMatch userInputString) dictionary

            -- Print results to consoles
            putStrLn ("Here are your words for \"" ++ userInputString ++ "\":")
            putStrLn $ show outputList ++ "\n\n"

            -- Recursively call mainProgram for new input
            mainProgram dictionary


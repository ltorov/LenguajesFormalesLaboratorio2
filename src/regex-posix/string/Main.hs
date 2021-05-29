module Main where
--https://chrisdone.com/posts/measuring-duration-in-haskell/

import Text.Regex.Posix.String
import Text.Regex.Posix
import System.Environment (getArgs)
import Data.Time

isRegEx:: String -> String -> Bool
isRegEx x y = y =~ x :: Bool

boolToString :: Bool -> String
boolToString True  = "True"
boolToString False = "False"

printaux ::  Bool -> String
printaux a = "Result: " ++ boolToString a

main :: IO ()
main = do 
    start <- getCurrentTime
    file  <- getArgs
    input <- readFile (head(file))
    let source = last(file)
    let match  = isRegEx source input 
    print (printaux match)
    stop <- getCurrentTime
    print "Time: "
    print $ diffUTCTime stop start
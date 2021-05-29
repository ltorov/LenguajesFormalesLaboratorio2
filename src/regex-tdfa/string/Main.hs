module Main where

import Text.Regex.TDFA
import Text.Regex.TDFA.String
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
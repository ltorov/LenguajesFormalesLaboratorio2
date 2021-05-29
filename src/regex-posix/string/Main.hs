module Main where
--https://chrisdone.com/posts/measuring-duration-in-haskell/

import Text.Regex.Posix.String
import Text.Regex.Posix
import System.IO
import Text.Read (readMaybe)
import Data.List ( nub )
import Data.Typeable  
import System.Environment (getArgs)
import Data.Time

isRegEx:: String -> String -> Bool
isRegEx x y = y =~ x :: Bool

main :: IO ()
main = do 
    start <- getCurrentTime
    file <- getArgs
    input <- readFile (head(file))
    let source = last(file)
    let match = isRegEx source input 
    print match
    stop <- getCurrentTime
    putStrLn " "
    print $ diffUTCTime stop start

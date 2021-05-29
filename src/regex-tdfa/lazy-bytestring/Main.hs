module Main where

import Text.Regex.TDFA
import qualified Data.ByteString.Lazy.Char8 as L
import System.Environment (getArgs)
import Data.Time

isRegEx:: L.ByteString ->  L.ByteString -> Bool
isRegEx x y =  y =~ x :: Bool

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
    let source    = L.pack (last(file))
    let inputaux  = L.pack input
    let match     = isRegEx source inputaux
    print (printaux match)
    stop <- getCurrentTime 
    print "Time: " 
    print $ diffUTCTime stop start
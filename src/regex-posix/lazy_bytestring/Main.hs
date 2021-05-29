module Main where

--Libraries needed
import qualified Data.ByteString.Lazy.Char8 as L
import Text.Regex.Posix
import System.Environment (getArgs)
import Data.Time

--This function recieves two parameters of type lazy bytestring and returns a boolean.
--It determines whether the regular expression matches the lazy bytestring contained in the text file.
isRegEx:: L.ByteString ->  L.ByteString -> Bool
isRegEx x y =  y =~ x :: Bool

--Auxiliary function which recieves a boolean and writes it as a string.
boolToString :: Bool -> String
boolToString True  = "True"
boolToString False = "False"

--Auxiliary function which recieves a boolean and return a string chain of the format required.
printaux ::  Bool -> String
printaux a = "Result: " ++ boolToString a

--The main function which reads from the command the arguments, text file name and the regular expression, reads the text file and prints the expected output.
main :: IO ()
main = do 
    start <- getCurrentTime
    file  <- getArgs
    input <- readFile (head(file))
    let source   = L.pack (last(file))
    let inputaux = L.pack input
    let match    = isRegEx source inputaux
    print (printaux match)
    stop <- getCurrentTime
    print "Time: "
    print $ diffUTCTime stop start

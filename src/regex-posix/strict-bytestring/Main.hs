module Main where

--Imports the libraries needed
import qualified Data.ByteString.Char8 as S
import Text.Regex.Posix
import System.Environment (getArgs)
import Data.Time

--This function recieves two parameters of type strict Bytestring and returns a boolean.
--It determines whether the regular expression matches the strict Bytestring contained in the text file.
isRegEx:: S.ByteString ->  S.ByteString -> Bool
isRegEx x y =  y =~ x :: Bool

--Auxiliary function which recieves a boolean and writes it as a string
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
    let source   = S.pack (last(file))
    let inputaux = S.pack input
    let match    = isRegEx source inputaux
    print (printaux match)
    stop <- getCurrentTime
    print "Time: "
    print $ diffUTCTime stop start

module Main where

--import Text.Regex.Posix.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L
import Text.Regex.Posix
import System.IO
import Text.Read (readMaybe)
import Data.List ( nub )
import Data.Typeable  
import System.Environment (getArgs)
import Data.Time



isRegEx:: L.ByteString ->  L.ByteString -> Bool
isRegEx x y =  y =~ x :: Bool

main :: IO ()
main = do 
    start <- getCurrentTime
    file <- getArgs
    input <- readFile (head(file))
    let source = L.pack (last(file))
    let inputaux = L.pack input
    let match = isRegEx source inputaux
    print match
    stop <- getCurrentTime
    putStrLn " "
    print $ diffUTCTime stop start
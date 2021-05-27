import Criterion.Measurement
import Text.Regex.Posix
import System.IO
--Reads the input into a FA and takes the name of the file to be read as what the user inputs
main :: IO ()
main = do 
    s <- readFile "tx1.txt"
    print s
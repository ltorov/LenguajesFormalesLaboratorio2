--https://chrisdone.com/posts/measuring-duration-in-haskell/

import Text.Regex.Posix
import System.IO
import Text.Read (readMaybe)
import Data.List ( nub )
import Data.Set ( Set )
import Data.String
import Data.Typeable 
import System.CPUTime
import Text.Printf
import Control.Monad.IO.Class (MonadIO(liftIO))
import Control.Exception
import Formatting
import Formatting.Clock
import System.Clock


data PosixString = PosixString String String 
    deriving (Eq, Ord)


isRegEx:: String -> String -> Bool
isRegEx x y = y =~ x :: Bool

main :: IO ()
main = do 
    file <- getLine
    start <- getTime Monotonic
    let arr = words file
    input <- readFile (head(arr))
    let source = last(arr)
    let b = input =~ source :: Bool 
    end <- getTime Monotonic
    print b
    putStrLn " "
    fprint (timeSpecs ) start end


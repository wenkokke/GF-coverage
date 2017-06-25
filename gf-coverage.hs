module Main where

import Control.Monad (forM_)
import Data.Maybe (isJust)
import Data.Monoid (mconcat,Sum(..))
import System.Exit (exitSuccess)
import System.FilePath.Glob (glob)
import qualified PGF

pgfFile = "grammars/translatorWithoutChunk/Translate.pgf"

main :: IO ()
main = do
  translator <- PGF.readPGF pgfFile
  print (PGF.languages translator)

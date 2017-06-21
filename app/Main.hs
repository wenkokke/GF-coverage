module Main where

import Control.Monad (forM_)
import Data.Maybe (isJust)
import Data.Monoid (mconcat,Sum(..))
import System.Exit (exitSuccess)
import System.FilePath.Glob (glob)
import qualified PGF

dataFile, pgfFile :: FilePath
pgfFile = "grammars/english/Lang.pgf"
dataFile = "data/gutenberg.txt"

main :: IO ()
main = do
  langEng <- PGF.readPGF pgfFile
  paths <- glob dataFile
  sents <- concat <$> mapM (fmap lines . readFile) paths

  let
    success,failure :: (Sum Double, Sum Double)
    success = (Sum 1,Sum 0)
    failure = (Sum 0,Sum 1)
    results =
      [if isJust (PGF.readExpr sent) then success else failure | sent <- sents]

  let
    (Sum success, Sum failure) = (mconcat results)

  print (success / (success + failure) * 100)

{-# LANGUAGE TupleSections #-}
module Main where

import Control.Arrow (first)
import Control.Monad (forM_,when)
import Data.Char (toLower)
import Data.Map (Map)
import qualified Data.Map as M
import Data.Maybe (maybe)
import Data.Monoid ((<>))
import Data.List (stripPrefix)
import Data.List.Extra (takeEnd)
import Numeric.Extra (intToDouble)
import qualified System.Console.Terminal.Size as W
import System.Directory (doesFileExist)
import System.FilePath (takeFileName)
import System.IO (withFile,IOMode(..),hPutStrLn,hFlush,stdout)
import Text.Printf (printf)
import qualified PGF2 as GF

pgfFile = "GF/examples/app/App16.pgf"
epPatn  = "data/Europarl/Europarl.%s-%s.%s"
osPatn  = "data/OpenSubtitles/OpenSubtitles.%s-%s.%s"

main :: IO ()
main = do
  putStrLn $ "Loading " <> takeFileName pgfFile <> "..."
  pgf <- GF.readPGF pgfFile
  let grams = map (first toISO639_1) . M.assocs . GF.languages $ pgf
  let gramPairs = [(g1,g2) | g1 <- grams, g2 <- grams, fst g1 < fst g2]
  forM_ gramPairs $ \((n1,g1),(n2,g2)) -> do
    let ep1 = printf epPatn n1 n2 n1
    let ep2 = printf epPatn n1 n2 n2
    translateCorpus pgf g1 g2 ep1 (ep2 <> ".out")
    translateCorpus pgf g2 g1 ep2 (ep1 <> ".out")
    let os1 = printf osPatn n1 n2 n1
    let os2 = printf osPatn n1 n2 n2
    translateCorpus pgf g1 g2 os1 (os2 <> ".out")
    translateCorpus pgf g2 g1 os2 (os1 <> ".out")

translateCorpus :: GF.PGF -> GF.Concr -> GF.Concr -> FilePath -> FilePath -> IO ()
translateCorpus pgf g1 g2 fIn fOut = do
  windowWidth <- maybe 60 W.width <$> W.size
  fInExist <- doesFileExist fIn
  let fnIn  = takeFileName fIn
  let fnOut = takeFileName fOut
  when (fInExist) $ do
    putStrLn $ "Generate " <> fnOut <> "..."
    linesIn <- lines <$> readFile fIn
    let total = intToDouble $ length linesIn
    withFile fOut WriteMode $ \hOut -> do
      forM_ (zip [1..] linesIn) $ \(done, line) -> do

        let
          barWidth  = windowWidth - 10                    :: Int
          frac      = done / total                        :: Double
          blockDone = floor $ intToDouble barWidth * frac :: Int
          blockTodo = barWidth - blockDone                :: Int
          percent   = frac * 100                          :: Double

        putStr $ printf "\r[%s%s] %6.2f%%"
          (replicate blockDone '#') (replicate blockTodo '.') percent
        hFlush stdout

        case GF.parse g1 (GF.startCat pgf) line of
          Right ((tr1,_):_) -> hPutStrLn hOut (GF.linearize g2 tr1)
          _                 -> hPutStrLn hOut "" -- an error has occurred

toISO639_1 :: GF.ConcName -> String
toISO639_1 = go . map toLower . takeEnd 3
  where
    go "chi" = "zh"
    go "est" = "et"
    go "ger" = "de"
    go "jpn" = "ja"
    go "swe" = "sv"
    go "bul" = "bg"
    go "dut" = "nl"
    go "fin" = "fi"
    go "hin" = "hi"
    go "rus" = "ru"
    go "tha" = "th"
    go "cat" = "ca"
    go "eng" = "en"
    go "fre" = "fr"
    go "ita" = "it"
    go "spa" = "es"

-- -}
-- -}
-- -}
-- -}


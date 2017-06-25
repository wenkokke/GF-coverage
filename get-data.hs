{-# LANGUAGE RecordWildCards #-}

import Lib
import Control.Monad (forM_)
import Data.Maybe (isJust,fromJust)
import Data.Monoid ((<>))
import Data.LanguageCodes
import Data.List (nub,sort,intersect)
import Data.List.Extra (dropEnd)
import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util
import Prelude hiding (Ordering(..))

-- * Configuration for the GF translation grammars
dataDir       = "data"
grammarDir    = "grammars"
translatorDir = grammarDir </> "translatorWithoutChunk"
gfLangCodes   = [BG, CA, DE, EN, ES, ET, FI, FR, HI, IT, NL, ZH, SV, TH]
gfGfPaths     =
  [ translatorDir </> "Translate" <> fromJust langCode <> ".gf"
  | l <- gfLangCodes, let langCode = iso639ToGF l, isJust langCode ]

-- * Configuration for the Europarl Parallel Corpus
ep = Corpus{..}
  where
    langCodes = [BG, CS, DA, DE, EL, EN, ES, ET, FI, FR, HU,
                 IT, LT, LV, NL, PL, PT, RO, SK, SL, SV]
                `intersect` gfLangCodes
    dir = dataDir </> "europarl"
    url = "http://opus.lingfil.uu.se/Europarl/"

    iso639ToArc l1 l2 =
      let [l1', l2'] = sort [l1, l2] in
        dir </> l1' <> "-" <> l2' <> ".txt.zip"
    iso639ToTxt l1 l2 =
      let [l1', l2'] = sort [l1, l2] in
        dir </> "Europarl." <> l1' <> "-" <> l2' <> "." <> l2
    txtToIso639 arc = (l1,l2)
      where
        (l1,'-':l2) =
          break (=='-') $
          removePrefix "Europarl." $
          removeSuffix "." $
          dropEnd 2 arc

    arcPaths =
      [iso639ToArc l1 l2 | l1 <- langs ep, l2 <- langs ep, l1 < l2]
    txtPaths = concat
      [ [iso639ToTxt l1 l2, iso639ToTxt l2 l1]
      | l1 <- langs ep, l2 <- langs ep, l1 < l2]

-- * Configuration for the OpenSubtitles Corpus
os = Corpus{..}
  where
    langCodes = [AF, AR, BG, BN, BR, BS, CA, CS, DA, DE, EL,
                 EN, EO, ES, ET, EU, FA, FI, FR, GL, HE, HI,
                 HR, HU, HY, ID, IS, IT, JA, KA, KK, KO, LT,
                 LV, MK, ML, MS, NL, NO, PL, PT, RO, RU, SI,
                 SK, SL, SQ, SR, SV, TA, TE, TH, TL, TR, UK,
                 UR, VI, ZH]
                `intersect` gfLangCodes
    dir       = dataDir </> "opensubtitles"
    url       = "http://opus.lingfil.uu.se/OpenSubtitles/"

    iso639ToArc l1 l2 =
      let [l1', l2'] = sort [l1, l2] in
        dir </> l1' <> "-" <> l2' <> ".txt.zip"
    iso639ToTxt l1 l2 =
      let [l1', l2'] = sort [l1, l2] in
        dir </> "OpenSubtitles." <> l1' <> "-" <> l2' <> "." <> l2
    txtToIso639 arc = (l1,l2)
      where
        (l1,'-':l2) =
          break (=='-') $
          removePrefix "OpenSubtitles." $
          removeSuffix "." $
          dropEnd 2 arc

    arcPaths =
      [iso639ToArc l1 l2 | l1 <- langs ep, l2 <- langs ep, l1 < l2]
    txtPaths = concat
      [ [iso639ToTxt l1 l2, iso639ToTxt l2 l1]
      | l1 <- langs ep, l2 <- langs ep, l1 < l2]

-- * Main data setup script
main :: IO ()
main = shakeArgs shakeOptions $ do
  download ep
  download os

  want [translatorDir </> "Translate.pgf"]

  translatorDir </> "Translate.pgf" %> \_ -> do
    forM_ gfGfPaths $ \src -> do
      command_ [] "gf" ["--make", src]

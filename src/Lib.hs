{-# LANGUAGE RecordWildCards #-}
module Lib where

import Control.Exception (assert)
import Data.Char (toLower)
import Data.LanguageCodes
import Data.List.Extra (splitAtEnd)
import Development.Shake
import Development.Shake.FilePath
import System.Exit (ExitCode(..))

type LangCode = String

data Corpus = Corpus
  { langCodes   :: [ISO639_1]
  , dir         :: FilePath
  , url         :: FilePath
  , iso639ToArc :: LangCode -> LangCode -> FilePath
  , iso639ToTxt :: LangCode -> LangCode -> FilePath
  , txtToIso639 :: FilePath -> (LangCode, LangCode)
  , arcPaths    :: [FilePath]
  , txtPaths    :: [FilePath]
  }

langs :: Corpus -> [FilePath]
langs c = map (map toLower . show) (langCodes c)

iso639ToGF :: ISO639_1 -> Maybe LangCode
iso639ToGF l = case l of
  BG -> Just "Bul" ; CA -> Just "Cat" ; DE -> Just "Ger"
  EN -> Just "Eng" ; ES -> Just "Spa" ; ET -> Just "Est"
  FI -> Just "Fin" ; FR -> Just "Fre" ; HI -> Just "Hin"
  IT -> Just "Ita" ; JA -> Just "Jpn" ; MT -> Just "Mlt"
  NL -> Just "Dut" ; RU -> Just "Rus" ; SV -> Just "Swe"
  TH -> Just "Tha" ; ZH -> Just "Chi" ; _  -> Nothing


-- * Setup functions
download :: Corpus -> Rules ()
download Corpus{..} = do
  want txtPaths

  arcPaths |%> \out -> do
    Exit i <- command [] "wget" ["-O", out, url </> takeFileName out]
    case i of
      ExitSuccess   -> return ()
      ExitFailure _ -> command_ [] "touch" [out]

  txtPaths |%> \out -> do
    let (l1,l2) = txtToIso639 (takeFileName out)
    let arcFile = iso639ToArc l1 l2
    need [arcFile]
    Exit i <- command [] "unzip" ["-nd", dir, arcFile]
    case i of
      ExitSuccess   -> return ()
      ExitFailure _ -> command_ [] "touch" [out]

-- * Helper functions
removePrefix,removeSuffix :: String -> String -> String
removePrefix prf str =
  let (prf',str') = splitAt (length prf) str
  in assert (prf == prf') str'
removeSuffix suf str =
  let (str',suf') = splitAtEnd (length suf) str
  in assert (suf == suf') str'

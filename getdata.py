from __future__  import print_function
from collections import namedtuple
from iso639      import languages
from os          import makedirs
from os.path     import isdir,isfile,join
from subprocess  import call

dataDir = "data"
dataUrl = "http://opus.lingfil.uu.se"
corpus = namedtuple('corpus', ['languages', 'dir', 'urlPatn', 'filePatn'])

"""Languages supported by GF."""
gf = ["bg", "de", "es", "fi", "fr", "hi", "zh", "sv"]
gf = set([(l,"en") if l < "en" else ("en",l) for l in gf])

"""Languages supported by both GF and the Europarl corpus."""
ep = ["bg", "cs", "da", "de", "el", "en", "es", "et", "fi", "fr",
      "hu", "it", "lt", "lv", "nl", "pl", "pt", "ro", "sk", "sl",
      "sv"]
ep = set([(l1,l2) for l1 in ep for l2 in ep if l1 < l2])\
     .intersection(gf)
ep = corpus(languages=ep,
            dir=join(dataDir,"Europarl"),
            urlPatn=join(dataUrl,"Europarl","{}-{}.txt.zip"),
            filePatn=join(dataDir,"Europarl","{}-{}.{}"))

"""Languages supported by both GF and the OpenSubtitles corpus."""
os = ["af", "ar", "bg", "bn", "br", "bs", "ca", "cs", "da", "de",
      "el", "en", "eo", "es", "et", "eu", "fa", "fi", "fr", "gl",
      "he", "hi", "hr", "hu", "hy", "id", "is", "it", "ja", "ka",
      "kk", "ko", "lt", "lv", "mk", "ml", "ms", "nl", "no", "pl",
      "pt", "ro", "ru", "si", "sk", "sl", "sq", "sr", "sv", "ta",
      "te", "th", "tl", "tr", "uk", "ur", "vi", "zh"]
os = set([(l1,l2) for l1 in os for l2 in os if l1 < l2])\
     .intersection(gf)
os = corpus(languages=os,
            dir=join(dataDir,"OpenSubtitles"),
            urlPatn=join(dataUrl,"OpenSubtitles","{}-{}.txt.zip"),
            filePatn=join(dataDir,"OpenSubtitles","{}-{}.{}"))

def getdata(corpus):
    """Download all the data files supported by both GF and the corpus."""
    if not isdir(corpus.dir):
        makedirs(corpus.dir)
    for l1,l2 in corpus.languages:
        if not (isfile(corpus.filePatn.format(l1,l2,l1)) and
                isfile(corpus.filePatn.format(l1,l2,l2))):
            err = call(["wget", "-NP", corpus.dir, corpus.urlPatn.format(l1,l2)])
            if not err:
                call(["unzip", "-oud", corpus.dir, corpus.filePatn.format(l1,l2,'txt.zip')])

if __name__ == "__main__":
    getdata(ep)
    getdata(os)

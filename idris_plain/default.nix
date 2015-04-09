{ cabal, annotatedWlPprint, ansiTerminal, ansiWlPprint
, base64Bytestring, binary, blazeHtml, blazeMarkup, boehmgc
, cheapskate, deepseq, filepath, fingertree, gmp, happy, haskeline
, lens, libffi, mtl, network, optparseApplicative, parsers, safe
, split, text, time, transformers, trifecta, unorderedContainers
, utf8String, vector, vectorBinaryInstances, xml, zlib
, fetchFromGitHub
}:

cabal.mkDerivation (self: {
  pname = "idris";
  src = fetchFromGitHub {
    owner = "puffnfresh";
    repo = "Idris-dev";
    rev = "dd5bd6f6643aac20dd1d872a49e1e02ba2873721";
    sha256 = "1ilbdyyv8xvxdmawlx3jn2wvb44b97lr3ns9czqz1dw5jd23g97m";
  };
  enableSharedExecutables = false;
  version = "0.9.17";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    annotatedWlPprint ansiTerminal ansiWlPprint base64Bytestring binary
    blazeHtml blazeMarkup cheapskate deepseq filepath fingertree
    haskeline lens libffi mtl network optparseApplicative parsers safe
    split text time transformers trifecta unorderedContainers
    utf8String vector vectorBinaryInstances xml zlib
  ];
  buildTools = [ happy ];
  extraLibraries = [ boehmgc gmp ];
  configureFlags = "-fgmp -fffi";
  jailbreak = true;
  meta = {
    homepage = "http://www.idris-lang.org/";
    description = "Functional Programming Language with Dependent Types";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})

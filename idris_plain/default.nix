{ cabal, annotatedWlPprint, ansiTerminal, ansiWlPprint
, base64Bytestring, binary, blazeHtml, blazeMarkup, boehmgc
, cheapskate, deepseq, filepath, fingertree, gmp, happy, haskeline
, lens, libffi, mtl, network, optparseApplicative, parsers, split
, text, time, transformers, trifecta, unorderedContainers
, utf8String, vector, vectorBinaryInstances, xml, zlib
, fetchFromGitHub
}:

cabal.mkDerivation (self: {
  pname = "idris";
  src = fetchFromGitHub {
    owner = "puffnfresh";
    repo = "Idris-dev";
    rev = "e13e48d7d440518ee4173a2f93b040dd76b27d91";
    sha256 = "07jm9dvxwihkwc5z0kvfnkq91dj0ylm4j2c4fb5fqbzydf1sxbkh";
  };
  enableSharedExecutables = false;
  version = "0.9.16";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    annotatedWlPprint ansiTerminal ansiWlPprint base64Bytestring binary
    blazeHtml blazeMarkup cheapskate deepseq filepath fingertree
    haskeline lens libffi mtl network optparseApplicative parsers split
    text time transformers trifecta unorderedContainers utf8String
    vector vectorBinaryInstances xml zlib
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

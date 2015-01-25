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
    rev = "27e4266df1532cce701e1179e51dbd9cf056b67a";
    sha256 = "1zmdc75s24521p8np1h6rv9dq5fdjxyabs9x1pifmwwd4bqf9rwq";
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

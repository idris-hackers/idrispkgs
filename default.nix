{ nixpkgs ? import <nixpkgs> {} 
, idris_plain ? nixpkgs.haskellPackages.callPackage ./idris_plain {}
}:

with nixpkgs;

let
  libraryDirectory = "${idris_plain.system}-ghc-${idris_plain.ghc.version}/${idris_plain.fname}";
in
rec {
  mkDerivation = { pname, version, buildDepends, src }: stdenv.mkDerivation {
    name = "${pname}-${version}";
    inherit src;
    buildInputs = [ (idrisWithPackages buildDepends) ];
    preConfigure = ''
      export TARGET="$out"
    '';
  };

  idrisWithPackages = pkgs: callPackage ./idris_plain/wrapper.nix {
    idris_plain = idris_plain;
    idrisLibraryPath = symlinkJoin "idris-env" ([
      "${idris_plain}/share/${libraryDirectory}"
    ] ++ pkgs);
  };

  lightyear = mkDerivation rec {
    pname = "lightyear";
    version = "7e7faf0eadc06ba3805582bd27f6a8fd0028f896";
    src = fetchFromGitHub {
      owner = "puffnfresh";
      repo = "lightyear";
      rev = version;
      sha256 = "169xar8sc575riqzh86mp2qfpsxs7x2xw0llgkkp1054gpdkzp2b";
    };
    buildDepends = [];
  };
  idris-config = mkDerivation rec {
    pname = "idris-config";
    version = "df7efeccd2137d508f1082f10715dbbae19d1407";
    src = fetchFromGitHub {
      owner = "puffnfresh";
      repo = "idris-config";
      rev = version;
      sha256 = "07i3g2gz1z9dasyd7lllwwflvpqhwqln49f37csbr4z9acpl5ln2";
    };
    buildDepends = [ lightyear ];
  };
}

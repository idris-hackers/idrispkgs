with import <nixpkgs> { };
with import ./default.nix { };

let myIdris = idrisWithPackages [ idris-config ];
in
stdenv.mkDerivation {
  name = "idris-nix-example";
  src = ./example.idr;
  buildCommand = ''
    mkdir -p $out/bin
    ${myIdris}/bin/idris -p config -o $out/bin/idris-nix-example $src
  '';
}

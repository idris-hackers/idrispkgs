with import <nixpkgs> { };
with import ./default.nix { };

runCommand "dummy" {
  buildInputs = [
    (idrisWithPackages [ idris-config ])
  ];
} ""

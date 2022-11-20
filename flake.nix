{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  # description = "Bash library for neighborly signal sharing";

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "bats-require";
      overlay = final: prev: {
        bats-require = final.pkgs.callPackage ./bats-require.nix { };
      };
    };
}

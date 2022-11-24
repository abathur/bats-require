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
    {
      overlays.default = final: prev: {
        bats-require = prev.callPackage ./bats-require.nix { };
      };
      # shell = ./shell.nix;
    } // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            self.overlays.default
          ];
        };
      in
        {
          packages = {
            inherit (pkgs) bats-require;
            default = pkgs.bats-require;
            # checks = packages.default.tests;
          };
        }
    );
}

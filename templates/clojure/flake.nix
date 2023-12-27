{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    clj-nix = {
      url = "github:jlesquembre/clj-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    clj-nix,
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages = {
        default = clj-nix.lib.mkCljApp {
          modules = [
            {
              projectSrc = "./.";
              name = "my-org/my-project";
              version = "0.1.0";
              main-ns = "demo.core";
            }
          ];
        };

        devShell = with pkgs;
          mkShell {
            buildInputs = [clojure polylith babashka];
          };
      };
    });
}

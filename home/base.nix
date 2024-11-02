{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
    # Every home installation has to have git, make it my config.
    ./common/git.nix
    inputs.nix-colors.homeManagerModule
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;

      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "sparrows";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    sessionPath = ["$HOME/.local/bin"];
    stateVersion = lib.mkDefault "24.05";
    sessionVariables = {
      #  FLAKE = "$HOME/nix-conf";
    };

    file = {
      "README.md".source = ../README.md;
      ".ssh/id_ed25519.pub".source = ../resources/keys/sparrows_id_ed25519.pub;
      ".ssh/allowed_signers".text = "* ${builtins.readFile ../resources/keys/sparrows_id_ed25519.pub}";
      ".background-image".source = ../resources/walls/mihael_stojcevic_sddm_backdrop.png;
    };
  };

  colorscheme = lib.mkDefault colorSchemes.rose-pine;
}

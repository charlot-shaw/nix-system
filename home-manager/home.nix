# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  eza,
  doom-emacs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./vscode.nix

    ./terminal.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sparrows";
    homeDirectory = "/home/sparrows";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # Utilities
    ripgrep
    gdu
    zoxide
    direnv
    libsForQt5.kate
    logseq

    # Comms
    element-desktop
    discord
    telegram-desktop
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  colorScheme = nix-colors.colorSchemes.everforest;

  # Programs configurations

  programs = {
    git = {
      enable = true;
      userEmail = "hello@sparrows.dev";
      userName = "Charlot Shaw";
      difftastic.enable = true;

      extraConfig = {
        rerere.enable = true;
        diff.algorithm = "patience";
        pull.rebase = true;

        commit.gpgsign = true;
        user.signingKey = "~/.ssh/id_ed25519.pub";
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        };
      };
    };
  };

  # Service configurations

  # Dotfiles management
  home.file = {
    # note, the SSH private key needs to be handled out of band still
    # This is copied in so that non-ssh daemon can read it.
    # See https://search.nixos.org/options?channel=unstable&show=users.users.%3Cname%3E.openssh.authorizedKeys.keyFiles&from=0&size=50&sort=relevance&type=packages&query=users.users.%3Cname%3E.openssh
    ".ssh/id_ed25519.pub".source = ./../identity/id_ed25519.pub;
    ".ssh/allowed_signers".text = "* ${builtins.readFile ./../identity/id_ed25519.pub}";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

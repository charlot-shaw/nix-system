# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  system,
  agenix,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-intel
    # inputs.hardware.nixosModules.common-ssd
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
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
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  networking.hostName = "perch";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  i18n.defaultLocale = "en_US.UTF-8";

  # graphical stuff
  services.xserver = {
    enable = true;
    layout = "us,us";
    xkbVariant = ",colemak_dh";
    xkbOptions = "grp:rctrl_rshift_toggle,grp_led:caps,caps:backspace";
    desktopManager.plasma5.enable = true;
  };

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # default packages
  environment.systemPackages = [
    pkgs.wget
    pkgs.vim
    pkgs.firefox
  ];

  # Shells
  # see https://nixos.wiki/wiki/Command_Shell

  environment.shells = with pkgs; [bash fish];
  programs.fish.enable = true;

  # User setup
  users.users = {
    sparrows = {
      isNormalUser = true;
      shell = pkgs.fish;
      # SSH private keys are handled out of band for the moment.
      openssh.authorizedKeys.keyFiles = [
        ../identity/id_ed25519.pub
      ];
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  # Tailscale setup

  services.tailscale = {
    enable = true;
    # https://github.com/tailscale/tailscale/issues/4254
    # keep an eye on this if Tailscale acts up.
  };

  # Syncthing setup, done here because home-manager doesn't allow the deep configuration I want.

  services.syncthing = {
    enable = true;
    user = "sparrows";
    overrideDevices = true;
    overrideFolders = true;
    dataDir = "/home/sparrows/core";
    configDir = "/home/sparrows/.config/syncthing";
    devices = {
      "mainframe" = {id = "6AWZK6A-62ODETB-LGYIFG4-XQSYD5V-4NB6B5C-EADRHVM-DV2M4B3-3IJAXAH";};
    };
    folders = {
      "ngjiq-utdkh" = {
        path = "/home/sparrows/core";
        devices = ["mainframe"];
      };
    };
  };

  # Secrets for syncthing
  age.secrets.st_key_pem = {
    file = ../secrets/st_key_pem.age;
    path = "/home/sparrows/.config/syncthing/key.pem";
  };

  age.secrets.st_cert_pem = {
    file = ../secrets/st_cert_pem.age;
    path = "/home/sparrows/.config/syncthing/cert.pem";
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  programs.ssh.startAgent = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}

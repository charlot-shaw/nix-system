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
    ./perch_hardware.nix
    ../common/user_sparrows.nix
    ../common/configuration_structure.nix
    ../common/bluetooth.nix
    ../common/ssh.nix
    ../common/utilities.nix
    ../common/pen_tablet.nix
  ];

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

  # Tailscale setup

  services.tailscale = {
    enable = true;
    # https://github.com/tailscale/tailscale/issues/4254
    # keep an eye on this if Tailscale acts up.
  };

  # Syncthing setup, done here because home-manager doesn't allow the deep configuration I want.

  services.syncthing = {
    enable = true;
    user = "stasis";
    overrideDevices = true;
    overrideFolders = true;
    dataDir = "/home/sparrows/core";
    configDir = "/home/sparrows/.config/syncthing";
    devices = {
      "mainframe" = {id = "6AWZK6A-62ODETB-LGYIFG4-XQSYD5V-4NB6B5C-EADRHVM-DV2M4B3-3IJAXAH";};
    };
    folders = {
      "ngjiq-utdkh" = {
        label = "Core synchronization";
        path = "/home/sparrows/core";
        devices = ["mainframe"];
      };
    };
  };

  # Used for steam
  hardware.opengl.driSupport32Bit = true;

  # Secrets for syncthing
  age.secrets.st_key_pem = {
    file = ../../../resources/secrets/st_key_pem.age;
    path = "/home/sparrows/.config/syncthing/key.pem";
  };

  age.secrets.st_cert_pem = {
    file = ../../../resources/secrets/st_cert_pem.age;
    path = "/home/sparrows/.config/syncthing/cert.pem";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}

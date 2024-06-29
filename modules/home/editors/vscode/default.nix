{
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  lib,
  # An instance of `pkgs` with your overlays and packages applied is also available.
  pkgs,
  # You also have access to your flake's inputs.
  inputs,
  # Additional metadata is provided by Snowfall Lib.
  namespace, # The namespace used for your flake, defaulting to "internal" if not set.
  system, # The system architecture for this host (eg. `x86_64-linux`).
  target, # The Snowfall Lib target for this system (eg. `x86_64-iso`).
  format, # A normalized name for the system target (eg. `iso`).
  virtual, # A boolean to determine whether this system is a virtual target using nixos-generators.
  systems, # An attribute map of your defined hosts.
  # All other arguments come from the module system.
  config,
  ...
}: {
  config = {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;

      extensions = with pkgs.vscode-extensions; [
        mvllow.rose-pine
        betterthantomorrow.calva
        bbenoist.nix
        mkhl.direnv
        kahole.magit
        ms-vscode-remote.remote-ssh
        tailscale.vscode-tailscale
        github.vscode-github-actions
      ];

      userSettings = {
        # Theme
        #workbench.colorTheme = "Rosé Pine";

        # Git
        "git.autofetch" = true;
        "git.confirmSync" = false;

        # Calva
        "calva.evaluationSendCodeToOutputWindow" = true;
        "calva.referencesCodeLens.enabled" = true;
        "calva.testOnSave" = true;
        "calva.useTestExplorer" = true;
        "calva.highlight.rainbowIndentGuides" = true;
      };

      userTasks = {
        version = "2.0.0";
        tasks = [
          {
            type = "shell";
            label = "Bump homemanager";
            command = "home-manager switch --flake .#$USER@$hostname";
          }
        ];
      };
    };
  };
}

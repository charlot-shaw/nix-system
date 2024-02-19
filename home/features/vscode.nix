{pkgs, ...}: {
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
}

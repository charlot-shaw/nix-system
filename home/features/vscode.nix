{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      # Theme
      workbench.colorTheme = "Everforest Dark";

      # Git
      "git.autofetch" = true;

      # Calva
      "calva.evaluationSendCodeToOutputWindow" = true;
      "calva.referencesCodeLens.enabled" = true;
      "calva.testOnSave" = true;
      "calva.useTestExplorer" = true;
      "calva.highlight.rainbowIndentGuides" = true;
    };
    extensions = with pkgs.vscode-extensions; [
      betterthantomorrow.calva
      bbenoist.nix
      mkhl.direnv
      kahole.magit
    ];
  };
}

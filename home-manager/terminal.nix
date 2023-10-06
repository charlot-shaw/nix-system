{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "zoxide init fish | source";
    };

    ssh = {
      enable = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
        # TODO figure out prompt preferences
        #format = "[:::](bold green)([:::](bold green)$hostname) ([:::](bold green)$username) $nixshell $directory\n>";
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}

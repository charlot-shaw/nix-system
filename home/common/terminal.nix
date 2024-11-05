{
  pkgs,
  config,
  ...
}: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        foreground = "#${config.lib.stylix.colors.base05}";
        background = "#${config.lib.stylix.colors.base00}";
      };
    };

    fish = {
      # TODO integrate with nix-colors.
      # Ref https://nix-community.github.io/home-manager/options.html#opt-programs.fish.enable
      enable = true;
      plugins = [
        {
          name = "foreign env";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-foreign-env";
            rev = "7f0cf099ae1e1e4ab38f46350ed6757d54471de7";
            sha256 = "4+k5rSoxkTtYFh/lEjhRkVYa2S4KEzJ/IJbyJl+rJjQ=";
          };
        }
      ];
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    ssh = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      settings = {
        add_newline = false;
        # TODO figure out prompt preferences
        #format = "[:::](bold green)([:::](bold green)$hostname) ([:::](bold green)$username) $nixshell $directory\n>";

        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[✖](bold red)";
        };
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}

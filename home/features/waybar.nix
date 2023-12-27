{config, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-right = ["network" "clock" "tray"];
        layer = "top";
      };
    };

    style = ''

      window#waybar {
        background: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
      }

      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #${config.colorScheme.colors.base08};
      }

    '';
  };
}

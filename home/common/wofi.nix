{config, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "bottom-left";
    };

    style = ''
      window {
        background-color: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base04};
        border: 2px solid #${config.lib.stylix.colors.base03};
        border-radius: 10px;
      }

      # input = {
        border-bottom: 2px solid #${config.lib.stylix.colors.base03};
        border-left: 2px solid #${config.lib.stylix.colors.base03};
        border-right: 2px solid #${config.lib.stylix.colors.base03};
      }

      #inner-box {
        padding: 4px;
        border: none;
      }

    '';
  };
}

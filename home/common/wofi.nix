{config, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "bottom-left";
    };

    style = ''
      window {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base04};
        border: 2px solid #${config.colorScheme.palette.base03};
        border-radius: 10px;
      }

      # input = {
        border-bottom: 2px solid #${config.colorScheme.palette.base03};
        border-left: 2px solid #${config.colorScheme.palette.base03};
        border-right: 2px solid #${config.colorScheme.palette.base03};
      }

      #inner-box {
        padding: 4px;
        border: none;
      }

    '';
  };
}

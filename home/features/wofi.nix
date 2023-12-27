{config, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "bottom-left";
    };

    style = ''
      window {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
      }

    '';
  };
}

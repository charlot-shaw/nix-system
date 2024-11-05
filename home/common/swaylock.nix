{
  config,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      indicator-radius = 100;
      indicator-thickness = 15;
      inside-color = config.lib.stylix.colors.base00;
      inside-clear-color = config.lib.stylix.colors.base01;
      text-color = config.lib.stylix.colors.base04;
      line-uses-ring = true;
      ring-color = config.lib.stylix.colors.base0D;
      ring-clear-color = config.lib.stylix.colors.base0F;
      ring-wrong-color = config.lib.stylix.colors.base0F;
      image = "~/.background-image";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 1000;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}

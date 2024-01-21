{
  config,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      indicator-radius = 100;
      indicator-thickness = 20;
      inside-color = config.colorScheme.colors.base01;
      ring-color = config.colorScheme.colors.base0A;
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

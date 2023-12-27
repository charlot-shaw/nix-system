{
  conf,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
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

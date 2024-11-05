{
  inputs,
  pkgs,
  config,
  ...
}: let
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  imports = [
    ./wofi.nix
    ./waybar.nix
  ];
  programs = {
  };

  home.packages = with pkgs; [
    cliphist
    font-awesome
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$launcher" = "wofi --show run,drun";
      "$bar" = "waybar";

      monitor = [
        # TODO See if I can get this to be bound to something other than ports.
        #portrait monitor
        "HDMI-A-1, 1920x1080, 2560x-180,1,transform,1"
        #main monitor
        "DP-2, 2560x1440,0x0,1"
        ",preferred,auto,auto"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        layout = "dwindle";
        resize_on_border = true;

        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base00})";
        "col.active_border" = "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base09}) 20deg";
      };

      decoration = {
        rounding = 10;
        inactive_opacity = 0.90;

        blur = {
          enabled = true;
          size = 16;
          passes = 4;

          vibrancy = "0.1696";
        };
      };

      # workspace rules
      workspace = [
        "1,monitor:DP-2"
        "2,monitor:DP-2"
        "3,monitor:DP-2"
        "4,monitor:DP-2"
        "5,monitor:DP-2"
        "6,name:COMM,monitor:HDMI-A-1"
        "7,monitor:HDMI-A-1"
        "8,monitor:HDMI-A-1"
        "9,monitor:HDMI-A-1"
        "0,monitor:HDMI-A-1"
      ];

      # initial startup apps
      exec-once = [
        "$terminal"
        "$bar"
        "wpaperd"

        "discord"
        "telegram-desktop"
      ];

      exec = [
      ];

      # keybinds
      bind =
        [
          "$mod, T, exec, $terminal"
          "$mod SHIFT, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, D, exec, $launcher"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          "$mod SHIFT, left, swapwindow, l"
          "$mod SHIFT, right, swapwindow, r"
          "$mod SHIFT, up, swapwindow, u"
          "$mod SHIFT, down, swapwindow, d"
        ]
        ++ workspaces;

      # mouse binds
      bindm = [
        "CTRL,mouse:272,movewindow"
      ];
    };
  };
}

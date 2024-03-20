{config, ...}: let
  module-radius = "10px";
  border-settings = "2px solid #${config.colorScheme.palette.base03};";
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        modules-left = ["clock" "hyprland/workspaces" "idle_inhibitor"];
        modules-right = ["pulseaudio" "network" "tray"];
        layer = "top";

        network = {
          format-wifi = " {essid}";
          format-ethernet = "";
          format-tooltip = "{ipaddr}/{cidr}";
          format-disconnected = "DISCON";
        };

        pulseaudio = {
          on-click = "pavucontrol";
          format = "{icon} {volume}%";
          format-muted = " {volume}%";
          format-icons = {
            headphones = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };

        clock = {
          interval = 60;
          tooltip = true;
          format = "{:%H.%M}";
          tooltip-format = "{:%Y-%m-%d}";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
      };
    };

    style = ''
      * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
        }


        /*
        base01: The background color of the bar itself
        base03: The color of dividers, borders, etc.
        base04: The neutral text color
        base0A: The positive text color
        base0F: The warning text color

        */

        window#waybar {
            background-color: transparent;
            color: #${config.colorScheme.palette.base04};
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #75715e;
        }

        #workspaces button.focused {
            box-shadow: inset 0 -3px #75715e;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #workspaces button.active {
          color: #${config.colorScheme.palette.base0A};
        }

        #mode {
            background-color: #64727D;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        .modules-left {
            border-bottom: ${border-settings}
            border-right: ${border-settings}
            border-bottom-right-radius: ${module-radius};
            background-color: #${config.colorScheme.palette.base01};
        }

        .modules-right {
            border-bottom: ${border-settings}
            border-left: ${border-settings}
            border-bottom-left-radius: ${module-radius};
            background-color: #${config.colorScheme.palette.base01};
        }

        .modules-right > widget:not(:last-child) {
            border-right: ${border-settings}
        }

        .modules-left > widget:not(:first-child) {
            border-left: ${border-settings}
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
            padding: 0 10px;
        }

        #battery {
            background-color: #ffffff;
            color: #000000;
        }

        #battery.charging, #battery.plugged {
            color: #ffffff;
            background-color: #f9f8f5;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }

        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: #ffffff;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {
            background-color: #000000;
        }

        #memory {
            background-color: #9b59b6;
        }

        #disk {
            background-color: #964B00;
        }

        #backlight {
            background-color: #90b1b1;
        }

        #network.disconnected {
            color: #${config.colorScheme.palette.base0F};
        }

        #pulseaudio.muted {
            color: #${config.colorScheme.palette.base0F};
        }

        #temperature {
            background-color: #f0932b;
        }

        #temperature.critical {
            background-color: #eb4d4b;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
        }

        #idle_inhibitor.activated {
            background-color: #ecf0f1;
            color: #2d3436;
        }

        #language {
            background: #00b093;
            color: #740864;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state {
            background: #97e1ad;
            color: #000000;
            padding: 0 0px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state > label {
            padding: 0 5px;
        }

        #keyboard-state > label.locked {
            background: rgba(0, 0, 0, 0.2);
        }

        #scratchpad {
            background: rgba(0, 0, 0, 0.2);
        }

        #scratchpad.empty {
        	background-color: transparent;
        }

        #privacy {
            padding: 0;
        }

        #privacy-item {
            padding: 0 5px;
            color: white;
        }

        #privacy-item.screenshare {
            background-color: #cf5700;
        }

        #privacy-item.audio-in {
            background-color: #1ca000;
        }

        #privacy-item.audio-out {
            background-color: #0069d4;
        }

    '';
  };
}

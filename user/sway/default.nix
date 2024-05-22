{  config, pkgs, ... }:

{
    home.packages = with pkgs; [ 
        sway 
        imv
    ];

    wayland.windowManager.sway = {
        enable = true;
        config = {
            terminal = "foot"; 
            modifier = "Mod1";
            menu = "bemenu-run";
            window = {
                titlebar = false;
            };
            output = {
                DP-1 = {
                    mode = "2560x1440@170hz";
                };
            };
            bars = [];
            input = {
                "*" = {
                    xkb_layout = "us,no,ro";
                };
            };
        };
        extraConfig = ''
            bar { 
                swaybar_command waybar
            }
        '';
    };

    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                height = 30;
                spacing = 4;

                modules-left = [ "battery" "backlight" "pulseaudio" "cpu" "memory" ];
                modules-center = [ "sway/workspaces" ];
                modules-right = [ "tray" "sway/language" "clock" ];

                tray = {
#"icon-size" = 21;
                    "spacing" = 10;
                };
                clock = {
                    "interval" = 1;
                    "format" = "{:%H:%M %Y-%m-%d %a}";
                    "timezone" = "Europe/Bucharest";
                    "tooltip-format" = ''
                        <big>{:%Y %B}</big>
                        <tt><small>{calendar}</small></tt>'';
                };
                cpu = {
                    "format" = "  {usage}%";
                };
                memory = { "format" = "  {}%"; };
                backlight = {
                    "format" = "{icon}  {percent}%";
                    "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
                };
                battery = {
                    "states" = {
                        "good" = 95;
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format" = "{icon}  {capacity}%";
                    "format-charging" = "  {capacity}%";
                    "format-plugged" = "  {capacity}%";
#"format-good" = ""; # An empty format will hide the module
#"format-full" = "";
                    "format-icons" = [ "" "" "" "" "" ];
                };
                "sway/language" = {
                    "format"= "{}";
                    "on-click"= "swaymsg input type:keyboard xkb_switch_layout next";
                };

                pulseaudio = {
                    "scroll-step" = 1;
                    "format" = "{icon}  {volume}%";
                    "format-bluetooth" = "{icon}  {volume}%  {format_source}";
                    "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
                    "format-muted" = "󰸈 {format_source}";
#"format-source" = "{volume}% ";
#"format-source-muted" = " ";
                    "format-icons" = {
                        "headphone" = "";
                        "hands-free" = "";
                        "headset" = "";
                        "phone" = "";
                        "portable" = "";
                        "car" = "";
                        "default" = [ "" "" "" ];
                    };
                    "on-click" = "exec pavucontrol";
                };
            };
        };
    };
}
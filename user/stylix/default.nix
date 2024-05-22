{ config, pkgs, ... }:

{
    stylix = {
        image = ./../../wallpapers/pyramids.jpg;
        base16Scheme =
            "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        fonts = {
            monospace = {
                package = pkgs.nerdfonts;
                name = "JetBrainsMono Nerd Font";
            };
        };
    };
}

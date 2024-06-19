{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./../../wallpapers/anime_skull.png;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "JetBrainsMono Nerd Font";
      };
    };
    targets = {
      nixvim.enable = false;
    };
  };
}

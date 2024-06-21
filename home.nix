{ config, pkgs, ... }:

{
  imports = [
    ./user/zsh
    ./user/nixvim
    ./user/foot
    ./user/sway
    ./user/tmux
    ./user/stylix
    ./user/firefox
  ];

  home.username = "sondli";
  home.homeDirectory = "/home/sondli";

  programs.git = {
    enable = true;
    userName = "sondli";
    userEmail = "sondre.lillelien@gmail.com";
  };

  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = { };


  home.sessionVariables = { };

  programs.home-manager.enable = true;
}

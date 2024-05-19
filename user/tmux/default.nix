{  config, pkgs, ... }:

{
  home.packages = with pkgs; [ tmux ];

  programs.tmux = {
    enable = true;
    shell = "\${pkgs.zsh}/bin/zsh";
    prefix = "C-a";
    keyMode = "vi";
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
  };

}

{  config, pkgs, ... }:

{
    home.packages = with pkgs; [ tmux ];

    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}"+"/bin/zsh";
        baseIndex = 1;
        prefix = "C-a";
        keyMode = "vi";
        plugins = with pkgs.tmuxPlugins; [
            gruvbox
        ];
    };

}

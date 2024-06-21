{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ starship ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -lah";
      update = "home-manager switch --flake ~/nixfiles/";
      sd = "cd ~ && cd \$(find * -type d | fzf)";
      rustdev = "nix-shell ~/nixfiles/shells/rust.nix";
			dotnetdev = "nix-shell ~/nixfiles/shells/dotnet.nix";
    };
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

}

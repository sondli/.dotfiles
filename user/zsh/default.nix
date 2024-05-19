{ config, pkgs, ... }:

{   
	home.packages = with pkgs; [ starship ];

	programs.zsh = {
        enable = true;
		shellAliases = {
  			ll = "ls -lah";
			update = "home-manager switch --flake ~/.dotfiles/";
		};
    };

	programs.starship = {
		enable = true;
		enableZshIntegration = true;
	};

}

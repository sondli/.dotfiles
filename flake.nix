# TODO: Screenshots, kb layout, notifications

{
    description = "My first flake!";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix.url = "github:danth/stylix";
    };

    outputs = { self, nixpkgs, home-manager, nixvim, stylix, ... }: 
    let 
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            desktop = lib.nixosSystem {
                inherit system; 
                modules = [ 
                    ./configuration.nix 
                ];
            };
        };
        homeConfigurations = {
            sondli = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ 
                    stylix.homeManagerModules.stylix
                    ./home.nix
                    nixvim.homeManagerModules.nixvim
                ];
            };
        };
    };
}

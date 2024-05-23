{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./system/gaming.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "desktop";

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Bucharest";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "ro_RO.UTF-8";
        LC_IDENTIFICATION = "ro_RO.UTF-8";
        LC_MEASUREMENT = "ro_RO.UTF-8";
        LC_MONETARY = "ro_RO.UTF-8";
        LC_NAME = "ro_RO.UTF-8";
        LC_NUMERIC = "ro_RO.UTF-8";
        LC_PAPER = "ro_RO.UTF-8";
        LC_TELEPHONE = "ro_RO.UTF-8";
        LC_TIME = "ro_RO.UTF-8";
    };

    services.xserver.xkb = {
        layout = "us,no,ro";
        variant = "";
    };

    users.users.sondli = {
        isNormalUser = true;
        description = "sondli";
        extraGroups = [ "networkmanager" "wheel" "audio" ];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git 
        discord
        brave
        fastfetch
        btop
        pavucontrol
        fzf
        ripgrep
    ];

    services.xserver = {
        enable = true;
        displayManager = {
            gdm.enable = true;
        };
    };

    services.libinput.enable = true;

    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    }; 

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        pulse.enable = true;
    };

    system.stateVersion = "23.11";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

{  config, pkgs, ... }:

{
   home.packages = with pkgs; [ sway ];

   wayland.windowManager.sway = {
       enable = true;
       config = {
           terminal = "foot"; 
           modifier = "Mod1";
           menu = "bemenu-run";
           window = {
                titlebar = false;
           };
       };
   };
}

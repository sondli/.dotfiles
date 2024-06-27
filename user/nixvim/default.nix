{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./remap.nix

    ./plugins/obsidian
    ./plugins/telescope
    ./plugins/dap
    ./plugins/noice
    ./plugins/lsp
    ./plugins/cmp
    ./plugins/fugitive
    ./plugins/undotree
    ./plugins/nvim-tree
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    colorschemes.gruvbox.enable = true;

    extraPlugins = with pkgs.vimPlugins; [ plenary-nvim ];

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
    };
  };
}

{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		plugins = with pkgs.vimPlugins; [
			(nvim-treesitter.withPlugins (p: [
				p.tree-sitter-nix
				p.tree-sitter-vim
				p.tree-sitter-bash
				p.tree-sitter-lua
				p.tree-sitter-json
				p.tree-sitter-html
				p.tree-sitter-css
				p.tree-sitter-javascript
				p.tree-sitter-typescript
				p.tree-sitter-svelte
				p.tree-sitter-c_sharp
				p.tree-sitter-rust
				p.tree-sitter-go
			]))
            plenary-nvim
			harpoon2
			telescope-nvim
			undotree
			lualine-nvim
            nvim-tree-lua
            fugitive
            catppuccin-nvim
            nvim-lspconfig
            vim-nix
            lsp-zero-nvim
            nvim-cmp
            cmp-nvim-lsp
		];
		extraLuaConfig = ''
			${builtins.readFile ./set.lua}
			${builtins.readFile ./remap.lua}
			${builtins.readFile ./plugins/lualine.lua}
			${builtins.readFile ./plugins/telescope.lua}
			${builtins.readFile ./plugins/fugitive.lua}
			${builtins.readFile ./plugins/nvim-tree.lua}
			${builtins.readFile ./plugins/undotree.lua}
			${builtins.readFile ./plugins/colors.lua}
			${builtins.readFile ./plugins/lspconfig.lua}
			${builtins.readFile ./plugins/treesitter.lua}
			${builtins.readFile ./plugins/harpoon.lua}
		'';
	};

}

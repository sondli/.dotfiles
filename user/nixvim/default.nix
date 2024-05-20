{ config, pkgs, ... }:

{
    imports = [
    ];

    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;

        colorschemes.gruvbox.enable = true;

        extraPlugins = with pkgs.vimPlugins; [plenary-nvim];

        globals = {
            mapleader = " ";
        };

        opts = {
            switchbuf = "useopen,uselast";
            termguicolors = true;
            scrolloff = 8;
            swapfile = false;
            hlsearch = false;
            incsearch = true;

            shiftwidth = 4;
            tabstop = 4;
            softtabstop = 4;
            expandtab = true;
            smartindent = true;

            cursorline = true;
            number = true;
            relativenumber = true;
            numberwidth = 2;
            ruler = false;

            splitbelow = true;
            splitright = true;
            undofile = true;
            undolevels = 10000;

            signcolumn = "yes";
            cmdheight = 1;
            cot = ["menu" "menuone" "noselect"];
            colorcolumn = "120";

            updatetime = 100;
            timeout = true;
            timeoutlen = 250;

            foldlevel = 99;
            foldlevelstart = 99;
            foldenable = true;

            winwidth = 10;
            winminwidth = 10;
            equalalways = false;
        };

        plugins = {
            lightline.enable = true;
            fugitive.enable = true;
            telescope = {
                enable = true;
                keymaps = {
                    "<C-f>" = {
                        action = "git_files";
                    };
                    "<leader>pf" = "find_files";
                    "<leader>ps" = "live_grep";
                };
            };
            treesitter.enable = true;
            luasnip.enable = true;
            undotree.enable = true;
            lsp = {
                enable = true;
                servers = {
                    nil_ls.enable = true;
                    lua-ls.enable = true;
                    rust-analyzer = {
                        enable = true;
                        installCargo = true;
                        installRustc = true;
                    };
                    csharp-ls.enable = true;
                    html.enable = true;
                    gopls.enable = true;
                    cssls.enable = true;
                    jsonls.enable = true;
                    tsserver.enable = true;
                    svelte.enable = true;
                    sqls.enable = true;
                };
                keymaps.lspBuf = {
                    K = "hover";
                    gD = "references";
                    gd = "definition";
                    gi = "implementation";
                    gt = "type_definition";
#                    "]d" = "goto_next";
#                    "[d" = "goto_prev";
#                    "<leader>ca" = "code_action";
#                    "<leader>rn" = "rename";
                };
            };
            cmp = {
                autoEnableSources = true;
                settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
                ];
            };
            nvim-tree = {
                enable = true;
                autoClose = true;
                disableNetrw = true;
            };
        };

        keymaps = [
        {
            action = "<Cmd>NvimTreeToggle<CR>";
            key = "<leader>pv";
        }
        {
            action = "<Cmd>UndotreeToggle<CR>";
            key = "<leader>u";
        }
        {
            action = "<Cmd>Git<CR>";
            key = "<leader>gs";
        }
        ];

    };


}

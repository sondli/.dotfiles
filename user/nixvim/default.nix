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

    extraPlugins = with pkgs.vimPlugins; [ plenary-nvim ];

    globals = {
      mapleader = " ";
    };

    opts = {
      termguicolors = true;
      scrolloff = 8;
      swapfile = false;
      hlsearch = false;
      incsearch = true;

      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      smartindent = true;

      cursorline = true;
      number = true;
      relativenumber = true;
      numberwidth = 2;
      ruler = false;
      guicursor = "";

      splitbelow = true;
      splitright = true;
      undofile = true;
      undolevels = 10000;

      signcolumn = "yes";
      colorcolumn = "120";

      winwidth = 10;
      winminwidth = 10;
      equalalways = false;

			conceallevel = 1;
    };

    plugins = {
      lualine.enable = true;
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
      obsidian = {
        enable = true;
        settings = {
          workspaces = [
            {
              name = "personal";
              path = "~/vaults/personal";
            }
            {
              name = "work";
              path = "~/vaults/work";
            }
          ];
        };
      };
      noice = {
        enable = true;
        notify.enabled = false;
        messages.enabled = false;
      };
      dap = {
        enable = true;
        adapters.executables = {
          gdb = {
            command = "gdb";
            args = [ "-i" "dap" ];
          };
        };
        extensions = {
          dap-ui = {
            enable = true;
          };
          dap-virtual-text.enable = true;
        };
      };
      lsp = {
        enable = true;
        servers = {
          nil-ls = {
            enable = true;
          };
          lua-ls = {
            enable = true;
            settings.diagnostics.globals = [ "vim" ];
          };
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          csharp-ls.enable = true;
          html.enable = true;
          gopls.enable = true;
          cssls.enable = true;
          clangd.enable = true;
          jsonls.enable = true;
          tsserver.enable = true;
          svelte.enable = true;
          sqls.enable = true;
        };
        keymaps = {
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            "<leader>ca" = "code_action";
            "<leader>rn" = "rename";
            "<leader>f" = "format";
          };
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      nvim-tree.enable = true;
    };
    keymaps = [
      {
        action = "<Cmd>UndotreeToggle<CR>";
        key = "<leader>u";
      }
      {
        action = "<Cmd>Git<CR>";
        key = "<leader>gs";
      }
      {
        action = ''<Cmd>lua require("dapui").toggle()<CR>'';
        key = "<leader>dt";
      }
      {
        action = ''<Cmd>lua require("dap").toggle_breakpoint()<CR>'';
        key = "<leader>db";
      }
      {
        action = ''<Cmd>lua require("dap").continue()<CR>'';
        key = "<leader>dc";
      }
      {
        action = ''<Cmd>lua require("dap").step_over()<CR>'';
        key = "<leader>do";
      }
      {
        action = ''<Cmd>lua require("dap").step_into()<CR>'';
        key = "<leader>di";
      }
      {
        action = ''<Cmd>ObsidianNew<CR>'';
        key = "<leader>on";
      }
    ];
    extraConfigLua = ''
      			${builtins.readFile ./lua/remap.lua} 
      		${builtins.readFile ./lua/nvim-tree.lua} 
      		${builtins.readFile ./lua/cmp.lua} 
      		${builtins.readFile ./lua/dap.lua} 
      		'';
  };
}

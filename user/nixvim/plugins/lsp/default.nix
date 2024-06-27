{
  programs.nixvim = {
    plugins.lsp = {
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
  };
}

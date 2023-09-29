local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-telescope/telescope.nvim", tag = "0.1.3", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "dylanaraps/wal.vim" },
  { "ThePrimeagen/harpoon" },
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
  -- LSP ZERO
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"L3MON4D3/LuaSnip"},


})

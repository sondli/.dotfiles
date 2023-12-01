require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c_sharp",
        "javascript",
        "typescript",
        "go",
        "rust",
        "tsx",
        "toml",
        "json",
        "yaml",
        "css",
        "html"
    },
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

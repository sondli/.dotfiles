vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescriptreact", "javascriptreact" },
    callback = function()
        vim.bo.commentstring = "{/* %s */}"
    end,
})

require("neotest").setup({
  adapters = {
    require("neotest-dotnet")
  }
})

vim.keymap.set('n', '<leader>tn', '<Cmd>lua require("neotest").run.run()<CR>')
vim.keymap.set('n', '<leader>tf', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set('n', '<leader>td', '<Cmd>lua require("neotest").run.run({strategy = "dap"})<CR>')
vim.keymap.set('n', '<leader>ts', '<Cmd>lua require("neotest").run.stop()<CR>')
vim.keymap.set('n', '<leader>ta', '<Cmd>lua require("neotest").run.attach()<CR>')
vim.keymap.set('n', '<leader>tp', '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
vim.keymap.set('n', '<leader>to', '<Cmd>lua require("neotest").output.open({enter = true })<CR>')

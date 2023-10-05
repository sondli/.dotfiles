local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net7.0', 'file')
    end,
    env = {
        ASPNETCORE_ENVIRONMENT = "Local",
        ASPNETCORE_URLS = "https://localhost:9000"
    }
  },
}

vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

local dap = require('dap')

dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = { '--interpreter=vscode' }
}

--https://github.com/WhiteBlackGoose/dotfiles/blob/nixos/app-config/nvim/lua/settings/dap.lua

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net7.0', 'file')
        end,
        env = function()
            local port = vim.fn.input({ prompt = "Port: " })
            return {
                ASPNETCORE_ENVIRONMENT = "Local",
                ASPNETCORE_URLS = "https://localhost:" .. port
            }
        end
    },
}

vim.keymap.set("n", "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>du", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp",
    "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

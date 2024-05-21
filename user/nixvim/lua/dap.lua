local dap = require('dap')

dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = { '--interpreter=vscode', '-- ~/.dotnet/dotnet' }
}

--https://github.com/WhiteBlackGoose/dotfiles/blob/nixos/app-config/nvim/lua/settings/dap.lua

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            local requestDll = function()
                return vim.fn.input({
                    prompt = 'Path to dll: ',
                    default = vim.fn.getcwd() .. '/bin/Debug/',
                    completion = 'file'
                })
            end

            if vim.g['dotnet_last_dll_path'] == nil then
                vim.g['dotnet_last_dll_path'] = requestDll()
            else
                if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'],
                        '&yes\n&no', 2) == 1 then
                    vim.g['dotnet_last_dll_path'] = requestDll()
                end
            end
            return vim.g['dotnet_last_dll_path']
        end,
        env = function()
            local requestPort = function()
                return vim.fn.input({ prompt = "Port: " })
            end
            if vim.g['dotnet_last_port'] == nil then
                vim.g['dotnet_last_port'] = requestPort()
            else
                if vim.fn.confirm('Do you want to change the port?\n' .. vim.g['dotnet_last_port'],
                        '&yes\n&no', 2) == 1 then
                    vim.g['dotnet_last_port'] = requestPort()
                end
            end
            return {
                ASPNETCORE_ENVIRONMENT = "Local",
                ASPNETCORE_URLS = "https://localhost:" .. vim.g['dotnet_last_port']
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

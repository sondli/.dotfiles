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

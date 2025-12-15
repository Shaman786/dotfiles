local dap = require("dap")

-- 1. Get the base path for Mason packages (Cross-platform)
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
local debug_adapter_path = mason_path .. "/js-debug/src/dapDebugServer.js"

-- 2. If on Windows, normalize path separators to backslashes
if vim.fn.has("win32") == 1 then
  debug_adapter_path = debug_adapter_path:gsub("/", "\\")
end

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      debug_adapter_path,
      "${port}",
    },
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch JS file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.typescript = dap.configurations.javascript

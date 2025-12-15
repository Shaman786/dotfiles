local dap = require("dap")

-- 1. NODE.JS SETUP (Cross-Platform)
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
local debug_adapter_path = mason_path .. "/js-debug/src/dapDebugServer.js"

if vim.fn.has("win32") == 1 then
  debug_adapter_path = debug_adapter_path:gsub("/", "\\")
end

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { debug_adapter_path, "${port}" },
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

-- =========================================
-- 2. GO SETUP (Add this section)
-- =========================================
-- This automatically configures the "delve" debugger
require("dap-go").setup()

local dap = require("dap")
local dapui = require("dapui")

-- Setup the UI
dapui.setup()

-- Open UI automatically when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- Close UI automatically when debugging ends
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

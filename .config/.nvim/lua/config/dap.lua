local dap = require("dap")

-- =========================================
-- 1. NODE.JS SETUP
-- =========================================
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
-- 2. GO SETUP
-- =========================================
-- Robustly find 'dlv' on any OS (Windows/Linux/Mac)
local function get_delve_path()
  -- 1. Try the Mason install path (Preferred)
  local mason_path = vim.fn.stdpath("data") .. "/mason/bin/dlv"
  if vim.fn.has("win32") == 1 then
    mason_path = mason_path .. ".exe"
  end
  if vim.fn.filereadable(mason_path) == 1 then
    return mason_path
  end

  -- 2. Try the standard Go bin path (~/go/bin)
  -- Use 'go env GOPATH' if possible, otherwise fallback to default
  local go_path = vim.fn.trim(vim.fn.system("go env GOPATH"))
  if go_path == "" then
    go_path = vim.fn.expand("$HOME/go")
  end

  local dlv_path = go_path .. "/bin/dlv"
  if vim.fn.has("win32") == 1 then
    dlv_path = dlv_path .. ".exe"
  end

  if vim.fn.filereadable(dlv_path) == 1 then
    return dlv_path
  end

  -- 3. Fallback to system PATH
  return "dlv"
end

require("dap-go").setup({
  delve = {
    path = get_delve_path(),
    initialize_timeout_sec = 20,
    port = "${port}",
  },
})

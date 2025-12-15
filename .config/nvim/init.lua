-- bootstrap lazy.nvim, LazyVim and your plugins

-- 1. Try to find 'python3' or 'python' in the system PATH (Best for Linux/Mac/Correctly configured Windows)
if vim.fn.executable("python3") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python3")
elseif vim.fn.executable("python") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python")
else
  -- 2. Windows Fallback: If not in PATH, look in the dynamic User folder
  if vim.fn.has("win32") == 1 then
    -- vim.env.LOCALAPPDATA automatically points to C:/Users/<Current-User>/AppData/Local
    local python_path = vim.env.LOCALAPPDATA .. "/Programs/Python/Python313/python.exe"

    -- Only set it if that file actually exists
    if vim.fn.filereadable(python_path) == 1 then
      vim.g.python3_host_prog = python_path
    end
  end
end

require("config.lazy")

return {
  {
    "mfussenegger/nvim-dap",
    lazy = false, -- IMPORTANT on Windows
    -- Defining 'config' overrides Lazy.nvim's default behavior of calling setup()
    config = function()
      -- 1. Load your separate configuration file manually
      require("config.dap")

      -- OR (Recommended) Put the config logic directly here to keep it self-contained
      -- local dap = require("dap")
      -- dap.adapters["pwa-node"] = ...
    end,
  },
  -- Keymaps for nvim-dap
  vim.keymap.set("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
  end, { desc = "Debug: Toggle Breakpoint" }),
  vim.keymap.set("n", "<leader>dc", function()
    require("dap").continue()
  end, { desc = "Debug: Continue / Start" }),
  vim.keymap.set("n", "<leader>do", function()
    require("dap").step_over()
  end, { desc = "Debug: Step Over" }),
  vim.keymap.set("n", "<leader>di", function()
    require("dap").step_into()
  end, { desc = "Debug: Step Into" }),
  vim.keymap.set("n", "<leader>du", function()
    require("dapui").toggle()
  end, { desc = "Debug: Toggle UI" }),
}

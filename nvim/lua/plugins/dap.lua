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
}

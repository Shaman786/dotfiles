return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            -- Example: You can add custom ignore toggles here if needed
          },
        },
      },
      -- Global exclude patterns for all pickers
      exclude = { "OneDrive/", ".git/", "node_modules/" },
    },
  },
}

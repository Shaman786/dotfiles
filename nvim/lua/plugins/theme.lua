return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- 1. TRANSPARENCY: Disables the background so Warp's blue shines through
      transparent = true,

      -- 2. STYLES: Enables the "Devaslife" italic aesthetic
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Make sidebars (like NeoTree) and floating windows transparent too
        sidebars = "transparent",
        floats = "transparent",
      },

      -- 3. EXTRAS: Polished UI features from the README
      terminal_colors = true, -- Better colors in :terminal
      dim_inactive = true, -- Dims inactive windows for focus
      lualine_bold = true, -- Bold text in the status line
    },
  },

  -- Configure LazyVim to load this colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}

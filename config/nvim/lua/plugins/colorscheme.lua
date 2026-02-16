-- Tokyo Night colorscheme configuration
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- Options: 'storm', 'moon', 'night', 'day'
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "neo-tree", "terminal", "packer" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    },
    config = function(_, opts)
      vim.o.background = "dark"  -- Force dark mode
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-night")  -- Explicitly use night variant
    end,
  },
} 
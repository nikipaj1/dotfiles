-- Cyberdream colorscheme configuration
return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true, -- Enable transparency to see terminal background
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = true,
        terminal_colors = true,
        theme = {
          variant = "light", -- Use light variant for the vibrant gradient look
        },
        extensions = {
          telescope = true,
          mini = true,
          cmp = true,
          gitsigns = true,
          treesitter = true,
          whichkey = true,
          alpha = true,
        },
      })
      vim.cmd.colorscheme("cyberdream")
    end,
  },
} 
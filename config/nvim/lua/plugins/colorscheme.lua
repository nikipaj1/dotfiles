-- VSCode colorscheme configuration
return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
        -- Use 'dark' or 'light' theme
        color_overrides = {},
        group_overrides = {},
      })
      require("vscode").load()
    end,
  },
} 
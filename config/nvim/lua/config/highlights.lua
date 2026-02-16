-- Custom highlight overrides for borders
local M = {}

function M.setup()
  -- Wait for colorscheme to load
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true }),
    pattern = "*",
    callback = function()
      -- Set all border-related highlights to white
      local white = "#ffffff"
      
      -- Window separators (the lines between splits)
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = white })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = white })
      
      -- Floating window borders
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = white })
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      
      -- Neo-tree specific borders
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = white })
      vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = white })
      vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { fg = white })
      
      -- Telescope borders
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = white })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = white })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = white })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = white })
      
      -- LSP floating windows
      vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = white })
      vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = white })
      
      -- CMP (completion) borders
      vim.api.nvim_set_hl(0, "CmpBorder", { fg = white })
      vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { fg = white })
      
      -- Which-key borders
      vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = white })
      
      -- Notify borders
      vim.api.nvim_set_hl(0, "NotifyBorder", { fg = white })
      
      -- Terminal colors - use same background as Normal
      vim.api.nvim_set_hl(0, "Terminal", { link = "Normal" })
      vim.api.nvim_set_hl(0, "TerminalNormal", { link = "Normal" })
      vim.api.nvim_set_hl(0, "TerminalNC", { link = "Normal" })
      
      -- SmoothCursor highlight groups for the trail effect
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#FFD700" })
      vim.api.nvim_set_hl(0, "SmoothCursorRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "SmoothCursorOrange", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "SmoothCursorYellow", { fg = "#FFD700" })
      vim.api.nvim_set_hl(0, "SmoothCursorGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "SmoothCursorAqua", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "SmoothCursorBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "SmoothCursorPurple", { fg = "#C678DD" })
    end,
  })
  
  -- Also apply immediately if a colorscheme is already loaded
  if vim.g.colors_name then
    vim.cmd("doautocmd ColorScheme")
  end
end

return M
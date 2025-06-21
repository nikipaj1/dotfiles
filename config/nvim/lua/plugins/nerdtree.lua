-- NERDTree file explorer
return {
  {
    "preservim/nerdtree",
    keys = {
      { "<C-e>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NERDTree" },
      { "<leader>nf", "<cmd>NERDTreeFind<cr>", desc = "Find current file in NERDTree" },
    },
    config = function()
      -- NERDTree settings
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeShowBookmarks = 1
      vim.g.NERDTreeIgnore = { '\\.git$', '\\.DS_Store$', 'node_modules' }
      vim.g.NERDTreeAutoDeleteBuffer = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeShowLineNumbers = 0
      vim.g.NERDTreeWinSize = 35
      vim.g.NERDTreeQuitOnOpen = 0
      vim.g.NERDTreeHighlightCursorline = 1
      
      -- Custom NERDTree mappings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nerdtree",
        callback = function()
          local opts = { buffer = true, silent = true }
          vim.keymap.set("n", "<CR>", "o", opts)
          vim.keymap.set("n", "l", "o", opts)
          vim.keymap.set("n", "h", "x", opts)
        end,
      })
      
      -- Auto-close NERDTree if it's the only window left
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.fn.winnr("$") == 1 and vim.fn.exists("b:NERDTree") == 1 and vim.b.NERDTree.isTabTree() then
            vim.cmd("quit")
          end
        end,
      })
    end,
  },
} 
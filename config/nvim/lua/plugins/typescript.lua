-- TypeScript and React support
return {
  -- React snippets and better JSX support
  {
    "mlaursen/vim-react-snippets",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Better TypeScript errors
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact" },
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        use_trouble_qflist = false,
      })
    end,
    keys = {
      { "<leader>tc", "<cmd>TSC<cr>", desc = "Type Check" },
      { "<leader>tw", "<cmd>TSCWatch<cr>", desc = "Type Check Watch" },
      { "<leader>ts", "<cmd>TSCStop<cr>", desc = "Stop Type Check" },
    },
  },

  -- Package.json support
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = "json",
    config = function()
      require("package-info").setup()
    end,
    keys = {
      { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show package info" },
      { "<leader>nc", "<cmd>lua require('package-info').hide()<cr>", desc = "Hide package info" },
      { "<leader>nt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle package info" },
      { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update package" },
      { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete package" },
      { "<leader>ni", "<cmd>lua require('package-info').install()<cr>", desc = "Install package" },
      { "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change package version" },
    },
  },

  -- TypeScript utilities
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = {},
        tsserver_path = nil,
        tsserver_plugins = {},
        tsserver_max_memory = "auto",
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        tsserver_locale = "en",
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        code_lens = "off",
        disable_member_code_lens = true,
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
    },
    keys = {
      { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>cR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
      { "<leader>cI", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
      { "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
      { "<leader>cF", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
      { "<leader>cG", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
    },
  },
} 
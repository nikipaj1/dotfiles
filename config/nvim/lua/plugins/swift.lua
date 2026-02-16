-- Swift language support
return {
  -- Xcode integration (most comprehensive Swift plugin for Neovim)
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "swift" },
    config = function()
      require("xcodebuild").setup({
        show_build_progress_bar = true,
        logs = {
          auto_open_on_success_tests = false,
          auto_open_on_failed_tests = true,
          auto_open_on_success_build = false,
          auto_open_on_failed_build = true,
        },
      })
    end,
    keys = {
      -- Build commands (<leader>S = Swift)
      { "<leader>Sb", "<cmd>XcodebuildBuild<cr>", desc = "Build", ft = "swift" },
      { "<leader>SB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build for testing", ft = "swift" },
      { "<leader>Sr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build and run", ft = "swift" },
      { "<leader>Sc", "<cmd>XcodebuildCleanBuild<cr>", desc = "Clean build", ft = "swift" },

      -- Test commands
      { "<leader>St", "<cmd>XcodebuildTest<cr>", desc = "Test all", ft = "swift" },
      { "<leader>ST", "<cmd>XcodebuildTestTarget<cr>", desc = "Test target", ft = "swift" },
      { "<leader>Sf", "<cmd>XcodebuildTestSelected<cr>", desc = "Test selected", ft = "swift" },
      { "<leader>SF", "<cmd>XcodebuildTestClass<cr>", desc = "Test class", ft = "swift" },

      -- Project commands
      { "<leader>Sp", "<cmd>XcodebuildPicker<cr>", desc = "Xcode picker", ft = "swift" },
      { "<leader>Ss", "<cmd>XcodebuildSelectScheme<cr>", desc = "Select scheme", ft = "swift" },
      { "<leader>Sd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select device", ft = "swift" },

      -- Logs
      { "<leader>Sl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle logs", ft = "swift" },
      { "<leader>SL", "<cmd>XcodebuildOpenLogs<cr>", desc = "Open logs", ft = "swift" },

      -- Actions
      { "<leader>Sa", "<cmd>XcodebuildCodeActions<cr>", desc = "Code actions", ft = "swift" },
      { "<leader>Sq", "<cmd>XcodebuildQuickfixLine<cr>", desc = "Quickfix line", ft = "swift" },
    },
  },
}

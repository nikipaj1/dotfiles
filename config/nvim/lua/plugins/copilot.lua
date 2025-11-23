-- GitHub Copilot Configuration
return {
  -- Copilot base plugin
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Copilot settings
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      -- Key mappings for Copilot
      vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion"
      })

      vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)", {
        desc = "Accept Copilot word"
      })

      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-dismiss)", {
        desc = "Dismiss Copilot suggestion"
      })

      vim.keymap.set("i", "<C-k>", "<Plug>(copilot-next)", {
        desc = "Next Copilot suggestion"
      })

      -- Copilot panel
      vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", {
        desc = "Open Copilot panel"
      })
    end,
  },

  -- CopilotChat for interactive chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      window = {
        layout = 'vertical',
        width = 0.4,
      },
    },
    keys = {
      -- Toggle chat (most common action)
      {
        "<leader>cc",
        "<cmd>CopilotChatToggle<cr>",
        desc = "CopilotChat - Toggle",
      },
      -- Quick chat
      {
        "<leader>cC",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Reset chat
      {
        "<leader>cR",
        "<cmd>CopilotChatReset<cr>",
        desc = "CopilotChat - Reset",
      },
      -- Explain code
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Explain code",
      },
      -- Review code
      {
        "<leader>cv",
        "<cmd>CopilotChatReview<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Review code",
      },
      -- Fix code
      {
        "<leader>cf",
        "<cmd>CopilotChatFix<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Fix code",
      },
      -- Optimize code
      {
        "<leader>cx",
        "<cmd>CopilotChatOptimize<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Optimize code",
      },
      -- Generate docs
      {
        "<leader>cd",
        "<cmd>CopilotChatDocs<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Generate docs",
      },
      -- Generate tests
      {
        "<leader>cs",
        "<cmd>CopilotChatTests<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Generate tests",
      },
    },
  },
}

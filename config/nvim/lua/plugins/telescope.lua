-- Telescope configuration
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    event = "VeryLazy",
    opts = function()
      local actions = require("telescope.actions")
      
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },
          layout_config = {
            width = 0.9,
            height = 0.8,
            preview_cutoff = 120,
            horizontal = {
              preview_width = 0.6,
            },
            vertical = {
              width = 0.9,
              height = 0.95,
              preview_height = 0.5,
            },
            flex = {
              horizontal = {
                preview_width = 0.9,
              },
            },
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["<CR>"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                if selection then
                  actions.select_default(prompt_bufnr)
                end
              end,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key,
            },
            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                if selection then
                  actions.select_default(prompt_bufnr)
                end
              end,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      -- Load extensions
      pcall(require("telescope").load_extension, "fzf")

      -- Set up keymaps with explicit noremap and silent
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
      end

      -- File/Find mappings
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files")
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", "Live Grep")
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Buffers")
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "Help Tags")
      map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Recent Files")
      map("n", "<leader>fc", "<cmd>Telescope commands<cr>", "Commands")
      map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", "Grep String")
      map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", "Word under cursor")
      map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "Keymaps")
      map("n", "<leader>ft", "<cmd>Telescope filetypes<cr>", "File Types")
      map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", "Diagnostics")
      map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", "Quickfix")
      map("n", "<leader>fl", "<cmd>Telescope loclist<cr>", "Location List")
      map("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", "Jumplist")
      map("n", "<leader>fm", "<cmd>Telescope marks<cr>", "Marks")
      map("n", "<leader>fR", "<cmd>Telescope registers<cr>", "Registers")
      map("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", "Vim Options")
      map("n", "<leader>fa", "<cmd>Telescope autocommands<cr>", "Autocommands")
      map("n", "<leader>fH", "<cmd>Telescope highlights<cr>", "Highlights")
      map("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Fuzzy Find")
      map("n", "<leader>f:", "<cmd>Telescope command_history<cr>", "Command History")
      map("n", "<leader>f;", "<cmd>Telescope search_history<cr>", "Search History")

      -- Git mappings
      map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", "Git Files")
      map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", "Git Status")
      map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", "Git Branches")
      map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", "Git Commits")
      map("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", "Git Buffer Commits")
      map("n", "<leader>gh", "<cmd>Telescope git_stash<cr>", "Git Stash")

      -- LSP mappings
      map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", "Go to Definition")
      map("n", "gD", "<cmd>Telescope lsp_declarations<cr>", "Go to Declaration")
      map("n", "gr", "<cmd>Telescope lsp_references<cr>", "Go to References")
      map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "Go to Implementation")
      map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Go to Type Definition")
      map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols")
      map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols")
      map("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<cr>", "Code Actions")
    end,
  },
} 
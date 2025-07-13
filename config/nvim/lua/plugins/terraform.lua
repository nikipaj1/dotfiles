return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "terraform", "hcl" })
    end,
  },
  
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          settings = {
            terraform = {
              validation = {
                enable = true,
              },
              format = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        terraform = { "tflint" },
        tf = { "tflint" },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "terraform-ls", "tflint" })
    end,
  },
}
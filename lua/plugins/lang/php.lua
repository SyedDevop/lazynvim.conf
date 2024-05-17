local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local platform = vim.loop.os_uname().sysname
      if platform ~= "Windows_NT" then
        vim.list_extend(opts.ensure_installed, { "phpactor" })
      end
      vim.list_extend(opts.ensure_installed, {
        "pint",
        "intelephense",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          cmd = { "intelephense", "--stdio" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      ---@type table<string, conform.FiletypeFormatter>
      formatters_by_ft = {
        ["php"] = { "pint" },
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, nls.builtins.formatting.pint)
  --   end,
  -- },
}

local platform = vim.loop.os_uname().sysname
if platform ~= "Windows_NT" then
  vim.list_extend(M, {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          phpactor = {
            cmd = { "phpactor", "language-server" },
            filetypes = { "php" },
            root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
          },
        },
      },
    },
  })
end

-- Wright Now php is disabled.
-- Uncomment the last line to use php
-- require M
return {}

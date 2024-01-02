return {
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
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      lspconfig.intelephense.setup({
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
      })

      local platform = vim.loop.os_uname().sysname
      if platform ~= "Windows_NT" then
        lspconfig.phpactor.setup({
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
        })
      end
    end,
    -- end,
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
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.pint)
    end,
  },
}

-- local phpcs = require("lint").linters.phpcs
-- phpcs.args = {
--   "-q",
--   "-s",
--   "--standard=PEAR",
--   "--exclude=PEAR.Commenting.FunctionComment,PEAR.Commenting.FileComment,PEAR.Functions.FunctionCallSignature",
--   "--report=json",
--   "-",
-- }
return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        superhtml = {
          filetype = { "html", "shtml", "htm", "php" },
          cmd = { "superhtml", "lsp" },
          root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
        },
        intelephense = {
          enabled = true,
        },
        phpactor = {
          enabled = true,
          -- init_options = {
          --   ["language_server.diagnostics_on_update"] = false,
          --   ["language_server.diagnostics_on_open"] = false,
          --   ["language_server.diagnostics_on_save"] = false,
          --   ["language_server_phpstan.enabled"] = false,
          --   ["language_server_psalm.enabled"] = false,
          --   ["language_server_php_cs_fixer.enabled"] = false,
          -- },
        },
      },
    },
  },

  { "prettier/vim-prettier" },
  {
    "Bleksak/laravel-ide-helper.nvim",
    opts = {
      save_before_write = true,
      format_after_gen = true,
      models_args = {},
    },
    enabled = function()
      return vim.fn.filereadable("artisan") ~= 0
    end,
    keys = {
      {
        "<leader>lgm",
        function()
          require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
        end,
        desc = "Generate Model Info for current model",
      },
      {
        "<leader>lgM",
        function()
          require("laravel-ide-helper").generate_models()
        end,
        desc = "Generate Model Info for all models",
      },
    },
  },
  {
    "adibhanna/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lc", ":Composer<cr>", desc = "Composer" },
      { "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
    },
    config = function()
      require("laravel").setup({
        notifications = true, -- Enable/disable Laravel.nvim notifications (default: true)
        debug = false, -- Enable/disable debug error notifications (default: false)
        keymaps = true, -- Enable/disable Laravel.nvim keymaps (default: true)
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
      notify_on_error = true,
    },
  },
}

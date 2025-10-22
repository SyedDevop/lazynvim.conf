local phpcs = require("lint").linters.phpcs
phpcs.args = {
  "-q",
  "-s",
  "--standard=PEAR",
  "--exclude=PEAR.Commenting.FunctionComment,PEAR.Commenting.FileComment,PEAR.Functions.FunctionCallSignature",
  "--report=json",
  "-",
}
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
      },
    },
  },
  { "prettier/vim-prettier" },
  {
    "gbprod/phpactor.nvim",
    ft = "php",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      -- If the update/install notification doesn't show properly,
      -- you should also add here UI plugins like "folke/noice.nvim" or "stevearc/dressing.nvim"
    },
    opts = {
      -- you're options goes here
    },
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        php = { "php-cs-fixer" },
      },
      formatters = {
        ["php-cs-fixer"] = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
            "$FILENAME",
          },
          stdin = false,
        },
      },
      notify_on_error = true,
    },
  },
}

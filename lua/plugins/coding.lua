return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  -- tidy
  -- {
  --   "mcauley-penney/tidy.nvim",
  --   event = "VeryLazy",
  --   config = {
  --     filetype_exclude = { "markdown", "diff", "sh" },
  --   },
  -- },
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>gi",
        function()
          local gitignore = require("gitignore")
          gitignore.generate({})
        end,
        desc = "generate GitIgnore file",
      },
    },
  },
}

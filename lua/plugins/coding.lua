return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- tidy
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    config = {
      filetype_exclude = { "markdown", "diff" },
    },
  },
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
          gitignore.generate()
        end,
        desc = "generate GitIgnore file",
      },
    },
  },
}

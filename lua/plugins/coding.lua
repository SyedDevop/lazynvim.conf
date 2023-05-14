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
}

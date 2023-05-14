return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "dart",
      "css",
      "html",
      "javascript",
      "jsdoc",
      "scss",
      "tsx",
      "typescript",
      "rust", -- for rust
      "toml", -- for rust
      "ron", -- for rust
    })
  end,
}

return {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = function()
    require("flutter-tools").setup({})
  end,
  keys = {
    { "<leader>K", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show hover" },
  },
}

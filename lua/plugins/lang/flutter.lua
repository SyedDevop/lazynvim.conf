return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    -- opts = function()
    --   require("flutter-tools").setup({})
    -- end,
    -- keys = {
    --   { "<leader>K", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show hover" },
    -- },
  },
  { "Nash0x7E2/awesome-flutter-snippets" },
}

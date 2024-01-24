return {
  { "slint-ui/vim-slint" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        slint_lsp = {
          cmd = { "slint-lsp" },
          filetypes = { "slint" },
          root_dir = require("lspconfig.util").root_pattern(".slint", ".git"),
        },
      },
    },
    -- config = function()
    --   require("lspconfig").util.available_servers()["slint_lsp"].setup({})
    -- end,
  },
}

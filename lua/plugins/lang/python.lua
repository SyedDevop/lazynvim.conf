return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     table.insert(opts.sources, nls.builtins.formatting.black)
  --   end,
  -- },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "black" })
    end,
  },
  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     opts.parents = 0
  --     opts.enable_debug_output = true
  --   end,
  -- },
}

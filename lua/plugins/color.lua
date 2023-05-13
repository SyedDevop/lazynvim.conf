-- require(path)

return {
  -- "catppuccin/nvim",
  -- lazy = true,
  -- name = "catppuccin",
  -- opts = {
  --   flavour = "mocha",
  --   -- transparent_background = true,
  --   integrations = {
  --     nvimtree = false,
  --     ts_rainbow = true,
  --     aerial = true,
  --     dap = { enabled = true, enable_ui = true },
  --     mason = true,
  --     neotree = true,
  --     notify = true,
  --     semantic_tokens = true,
  --     symbols_outline = true,
  --     telescope = true,
  --     which_key = true,
  --   },
  -- },

  "navarasu/onedark.nvim",
  lay = true,

  opts = function()
    require("onedark").setup({
      style = "deep",
      toggle_style_key = "<leader>uq",
    })
    require("onedark").load()
  end,
}

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "zig", "zir" },
      root = { "zls.json", "build.zig" },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "zig" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {},
      },
    },
  },
}

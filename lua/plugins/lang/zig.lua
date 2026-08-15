M = {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "zig", "zir" },
      root = { "zls.json", "build.zig" },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "zig" } },
    config = function(_, _) end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          mason = false,
          filetypes = { "zig" },
          -- adjust root_dir as needed for your projects:
          -- root_dir = vim.lsp.config,
          on_new_config = function(new_config)
            new_config.cmd = { vim.fn.exepath("zls") or "zls" }
          end,
        },
      },
    },
  },
}
return M

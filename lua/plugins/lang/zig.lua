local bin_path = vim.fn.expand("~/.local/bin")
local zig_version_list = {
  "zig 0.13.0",
  "zig 0.14.1",
  "zig 0.15.2",
}
local zls_bin_list = {
  bin_path .. "/zls-13",
  bin_path .. "/zls-14",
  bin_path .. "/zls-15",
}
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

local zls_bin = vim.fn.expand("~/.local/bin/zls")
local util = require("lspconfig.util")

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
        zls = {
          filetypes = { "zig" },
          -- adjust root_dir as needed for your projects:
          root_dir = require("lspconfig.util").root_pattern("build.zig", ".git"),
          on_new_config = function(new_config, root_dir)
            local tv_file = root_dir .. "/.tool-versions"
            if vim.fn.filereadable(tv_file) == 1 then
              local lines = vim.fn.readfile(tv_file)
              for _, l in ipairs(lines) do
                if l:match("^%s*zig%s+0[.]13[.]0%s*$") then
                  new_config.cmd = { zls_bin }
                  return
                end
              end
            end
            -- fallback to whatever’s on your $PATH (or Mason-managed):
            new_config.cmd = { "zls" }
          end,
        },
      },
    },
  },
}

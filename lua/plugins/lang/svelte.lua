return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      svelte = {
        filetypes = { "svelte" },
        root_markers = { "package.json", "svelte.config.js", "svelte.config.mjs", "svelte.config.cjs", ".git" },
        settings = {
          svelte = {
            plugin = {
              html = {
                completions = {
                  enable = true,
                  emmet = true,
                },
              },
              svelte = {
                completions = {
                  enable = true,
                },
              },
              css = {
                completions = {
                  enable = true,
                  emmet = true,
                },
              },
            },
          },
        },
      },
    },
  },
}

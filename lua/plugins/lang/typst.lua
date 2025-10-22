return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    ft = "typst",
    version = "1.*",
    opts = {
      formatterMode = "typstyle",
    }, -- lazy.nvim will implicitly calls `setup {}`
    keys = {
      {
        "<leader>cp",
        ft = "typst",
        ":TypstPreviewToggle<cr>",
        desc = "Toggle Typest Preview",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
          },
        },
      },
    },
  },
}

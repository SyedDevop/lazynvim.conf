return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(
        opts.ensure_installed,
        { "bash-language-server", "shellcheck", "css-lsp", "html-lsp", "emmet-language-server" }
      )
    end,
  },
}

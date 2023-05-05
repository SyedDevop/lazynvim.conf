return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local clients = {}
        for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
          clients[#clients + 1] = client.name
        end
        return " LSP: " .. table.concat(clients, ", ")
      end,
    })
  end,
}

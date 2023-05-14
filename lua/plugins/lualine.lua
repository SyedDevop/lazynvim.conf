return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local function lsp_name(msg)
      msg = msg or "Inactive"
      local buf_clients = vim.lsp.get_active_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return "Inactive"
        end
        return msg
      end
      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      return table.concat(buf_client_names, ", ")
    end

    opts.sections = vim.tbl_deep_extend("force", opts.sections, {
      lualine_y = {
        {
          lsp_name,
          icon = " LSP:",
          color = { gui = "none" },
        },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
    })
  end,
}

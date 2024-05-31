M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections = vim.tbl_deep_extend("force", opts.sections, {
      lualine_z = {
        function()
          return "  " .. os.date("%r")
        end,
      },
    })

    opts.winbar = {
      lualine_c = { { "filename", path = 4 } },
    }

    opts.inactive_winbar = {
      lualine_c = { { "filename", path = 4 } },
    }
  end,
}

return M

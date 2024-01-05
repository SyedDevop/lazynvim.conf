return {
  "hrsh7th/nvim-cmp",
  dependencies = { "f3fora/cmp-spell" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        zindex = 1001,
        scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = false,
      },
      -- documentation = cmp.config.window.bordered(),
    }
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "crates", priority = 750 },
      {
        name = "spell",
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        },
      },
    }))
  end,
}

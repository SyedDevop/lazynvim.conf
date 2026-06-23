local function column_align_keep_delim(delim)
  delim = delim or ":"

  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  if start_line == 0 or end_line == 0 then
    vim.notify("Select lines in visual mode", vim.log.levels.ERROR)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local input = table.concat(lines, "\n")

  -- Replace delimiter with space-delim-space for column alignment
  local escaped = vim.fn.escape(delim, [[ \/.*$^~[] ]])
  local preprocess = string.format([[sed 's/%s/ %s /g' | column -t]], escaped, delim)

  local output = vim.fn.system(preprocess, input)

  if vim.v.shell_error ~= 0 then
    vim.notify("column failed", vim.log.levels.ERROR)
    return
  end

  local result = vim.split(output, "\n", { trimempty = true })
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result)
end

vim.api.nvim_create_user_command("ColumnAlign", function(opts)
  column_align_keep_delim(opts.args)
end, {
  nargs = "?",
  range = true,
  desc = "Align columns and keep delimiter",
})

return {
  {
    dir = "~/nvim-proj/mess.nvim/",
    cmd = { "Mess", "MessShow" },
    opts = {},
  },
  -- { "prichrd/netrw.nvim", opts = true },
  {
    dir = "~/nvim-proj/netrw.nvim/",
    opts = true,
  },
}

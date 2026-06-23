local function huid()
  return os.date("%Y%m%d%H%M")
end
local function insert_huid()
  local _uid = huid() .. ""
  vim.api.nvim_put({ _uid }, "c", true, true)
end

return {
  insert_huid = insert_huid,
}

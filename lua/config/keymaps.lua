-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- Undo Redo Keymaps.
map({ "n", "i", "v" }, "<C-z>", "<cmd>:u<cr>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd>:redo<cr>", { desc = "Redo" })
-- Copy Past Keymaps
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
map("n", "<C-c>", "yy", { desc = "Copy" })
map("i", "<C-c>", "<Esc> yy i", { desc = "Copy" })

-- Toggle UndoTree
map({ "n", "i", "v" }, "<leader>z", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })

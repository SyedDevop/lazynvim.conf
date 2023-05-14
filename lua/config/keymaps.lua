-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
-- Past keymap
map("i", "<C-v>", '<Esc> "+P i', { desc = "Past" })
map("n", "<C-v>", '"+p', { desc = "Past" })
map("c", "<C-v>", "<c-r>+", { desc = "Past", silent = true })

-- Toggle UndoTree
map({ "n", "v" }, "<leader>z", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })
-- Toggle terminal
map({ "n", "i", "v" }, "<C-/>", "<cmd>:ToggleTerm<cr> ", { desc = "Toggle terminal" })

-- Open file folders
map("n", "<leader>oo", function()
  vim.fn.system("gopa folder -- nvim-qt .")
end, { desc = "Open Folder in new instance" })

map("n", "<leader>of", function()
  vim.fn.system("gopa file -- nvim-qt")
  vim.cmd("cd %:p:h\ne")
end, { desc = "Open File in new instance" })

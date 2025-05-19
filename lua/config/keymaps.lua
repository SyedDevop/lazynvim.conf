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

map("n", "<leader>e", vim.cmd.Ex, { desc = "Open Nvim Explorer(netrw)" })

-- Nave KeyMaps
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in center" })

map("n", "n", "nzzzv", { desc = "Keep cursor in center" })
map("n", "N", "Nzzzv", { desc = "Keep cursor in center" })

-- Undo Redo Keymaps.
map({ "n", "i", "v" }, "<C-z>", "<cmd>:u<cr>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd>:redo<cr>", { desc = "Redo" })

-- Copy Past Keymaps
-- vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- map({ "n", "v" }, "<C-c>", [["+y]], { desc = "Copy", silent = true })
--
-- map({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Copy", silent = true })
-- map("v", "<C-c>", '"+y', { desc = "Copy" })
-- map("i", "<C-c>", '<Esc> \"+y  i', { desc = "Copy" })
-- Past keymap
-- map("i", "<C-v>", "<Esc> p i", { desc = "Past" })
-- map("n", "<C-v>", "p", { desc = "Past" })
-- map("c", "<C-v>", "<c-r>+", { desc = "Past", silent = true })
-- map("v", "<leader>P", '"_dp', { desc = "Past", silent = true })
vim.keymap.set("x", "<leader>p", '"0p', { noremap = true, silent = true })
vim.keymap.set("x", "<leader>P", '"0P', { noremap = true, silent = true })

-- Toggle UndoTree
map({ "n", "v" }, "<leader>z", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })

map("n", "<leader>xm", "<Cmd>Mess<CR>", { desc = "Show the messages" })

-- Change Buffers
map("n", "<tab>", "<Cmd>bnext<Cr>", { desc = "Go to next buffer" })
map("n", "<S-tab>", "<Cmd>bprev<Cr>", { desc = "Go to previews buffer" })

function _G.run_code()
  local filename = vim.fn.expand("%")
  local basename = vim.fn.expand("%:r")
  local filetype = vim.bo.filetype
  local cmd = nil

  if filetype == "python" then
    cmd = "term: python3 " .. filename
  elseif filetype == "c" then
    cmd = "term: gcc " .. filename .. " -o " .. basename .. " && ./" .. basename
  elseif filetype == "cpp" then
    cmd = "term: g++ " .. filename .. " -o " .. basename .. " && ./" .. basename
  elseif filetype == "java" then
    cmd = "term: javac " .. filename .. " && java " .. basename
  elseif filetype == "go" then
    cmd = "term: go run " .. filename
  elseif filetype == "zig" then
    cmd = "term: zig build run"
  end

  if cmd then
    vim.cmd(cmd)
  else
    print("Filetype not supported for execution.")
  end
end

vim.keymap.set("n", "<leader>r", "<cmd>lua _G.run_code()<cr>", { desc = "Run Code" })

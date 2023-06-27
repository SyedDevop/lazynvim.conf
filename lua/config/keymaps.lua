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
map("i", "<C-v>", '<Esc> "+p i', { desc = "Past" })
map("n", "<C-v>", '"+p', { desc = "Past" })
map("c", "<C-v>", "<c-r>+", { desc = "Past", silent = true })
map("x", "<C-v>", '"\\"_dp', { desc = "Past" })

-- Select the hole page.
map("n", "<C-a>", function()
  vim.g.minianimate_disable = true
  vim.cmd("normal! gg0vG$")
  vim.g.minianimate_disable = false
end, { desc = "Visually select all" })

-- Toggle UndoTree
map({ "n", "v" }, "<leader>z", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })
-- Toggle terminal
map({ "n", "i", "v" }, "<C-/>", "<cmd>:ToggleTerm<cr> ", { desc = "Toggle terminal" })

-- Change Buffers
map("n", "<tab>", "<Cmd>BufferLineCycleNext<Cr>", { desc = "Go to next buffer" })
map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<Cr>", { desc = "Go to previews buffer" })

-- Open file folders
map("n", "<leader>oo", function()
  vim.fn.system("gopa folder -- nvim-qt .")
end, { desc = "Open Folder in new instance" })

map("n", "<leader>of", function()
  vim.fn.system("gopa file -- nvim-qt")
  vim.cmd("cd %:p:h\ne")
end, { desc = "Open File in new instance" })

map("n", "<leader>os", function()
  local output = vim.fn.systemlist("gopa file -o ")
  if vim.v.shell_error == 1 then
    print(output)
  else
    local cmdArgs = "e " .. output[1]
    vim.cmd(cmdArgs)
  end
end, { desc = "Open File in same buffer" })

map("n", "<leader>od", function()
  vim.fn.system("gopa folder -- nvim-qt .")
  vim.cmd("xall")
end, { desc = "Open new Folder and close current instance" })

-- Python
map("n", "<leader>ce", '<cmd>lua require("swenv.api").pick_venv() <cr>', { desc = "Choose Python Env" })

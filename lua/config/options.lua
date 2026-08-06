-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here asdasd

-- LSP Server to use for TypeScript.
---@type "vtsls" | "tsgo"
vim.g.lazyvim_ts_lsp = "tsgo"
-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

local opt = vim.o
vim.g.lazyvim_php_lsp = "intelephense"
opt.spell = true
opt.winborder = "rounded"
local utils = require("util.utils")
vim.api.nvim_create_user_command("Huid", utils.insert_huid, {})

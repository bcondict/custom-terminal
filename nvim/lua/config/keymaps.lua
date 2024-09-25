-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
keymap.set("n", "<Leader>j", function()
  vim.diagnostic.goto_next()
end, { noremap = false, remap = true })

keymap.set("n", "<leader>i", function()
  require("bcondict.lsp").toggleInlayHints()
end)

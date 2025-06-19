-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- keymap.set("n", "<leader>j", function()
--   vim.diagnostic.goto_next()
-- end, opts)
-- end, {  })
-- end, { desc = "Go next error", table.unpack(opts) })

keymap.set("n", "<leader>r", function()
  require("bcondict.hsl").replaceHexWithHSL()
end)
-- end, { desc = "repalce Hex with Hsl" })

-- keymap.set("n", "<leader>i", function()
--   require("bcondict.lsp").toggleInlayHints()
-- end)
-- end, { desc = "toggle inlay hints" })

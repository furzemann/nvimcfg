-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local disabled_keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, key in ipairs(disabled_keys) do
  vim.keymap.set({ "n", "i", "v" }, key, "<Nop>", { noremap = true, silent = true })
end

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local disabled_keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, key in ipairs(disabled_keys) do
  vim.keymap.set({ "n", "i", "v" }, key, "<Nop>", { noremap = true, silent = true })
end

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "Expand or jump in snippet" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Jump backward in snippet" })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true, desc = "Cycle snippet choices" })

vim.keymap.set("n", "<leader>cft", function()
  vim.cmd("CompetiTest receive testcases")
end)
vim.keymap.set("n", "<leader>cfr", function()
  vim.cmd("CompetiTest run")
end)

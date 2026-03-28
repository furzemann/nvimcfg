-- ============================================================
--  config/keymaps.lua — all non-plugin keymaps
-- ============================================================

vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

local map            = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- ── General ─────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>", "Save file")
map("n", "<leader>q", "<cmd>q<cr>", "Quit")
map("n", "<leader>Q", "<cmd>qa!<cr>", "Force quit all")
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- ── Window navigation ────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", "Move to left split")
map("n", "<C-j>", "<C-w>j", "Move to lower split")
map("n", "<C-k>", "<C-w>k", "Move to upper split")
map("n", "<C-l>", "<C-w>l", "Move to right split")

-- ── Window resize ────────────────────────────────────────────
map("n", "<C-Up>", "<cmd>resize +2<cr>", "Increase height")
map("n", "<C-Down>", "<cmd>resize -2<cr>", "Decrease height")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease width")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase width")

-- ── Buffers ──────────────────────────────────────────────────
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer")
map("n", "<S-h>", "<cmd>bprevious<cr>", "Prev buffer")
map("n", "<leader>bd", "<cmd>bdelete<cr>", "Delete buffer")

-- ── Indentation — keep visual selection ─────────────────────
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- ── Move lines ───────────────────────────────────────────────
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move selection up")

-- ── Diagnostics (LSP) ────────────────────────────────────────
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "<leader>e", vim.diagnostic.open_float, "Float diagnostic")
map("n", "<leader>dl", vim.diagnostic.setloclist, "Diagnostics to loclist")
-- ── Competitive Programming (better namespace) ──
map("n", "<leader>pr", "<cmd>CompetiTest receive problem<cr>", "Receive problem")
map("n", "<leader>prr", "<cmd>CompetiTest run<cr>", "Run solution")
map("n", "<leader>pt", "<cmd>CompetiTest test<cr>", "Run tests")
map("n", "<leader>pa", "<cmd>CompetiTest add_testcase<cr>", "Add testcase")
map("n", "<leader>pe", "<cmd>CompetiTest edit_testcase<cr>", "Edit testcase")
map("n", "<leader>pd", "<cmd>CompetiTest delete_testcase<cr>", "Delete testcase")
map("n", "<leader>po", "<cmd>CompetiTest open_testcases<cr>", "Open testcases")


map("n", "<leader>cft", function()
  vim.cmd("CompetiTest receive testcases")
end)
map("n", "<leader>cfr", function()
  vim.cmd("CompetiTest run")
end)

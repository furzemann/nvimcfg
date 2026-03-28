-- ============================================================
--  config/autocmds.lua — autocommands
-- ============================================================

local augroup = function(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = augroup("yank_highlight"),
  callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group    = augroup("restore_cursor"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 2-space indent for web files
vim.api.nvim_create_autocmd("FileType", {
  group   = augroup("web_indent"),
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact",
              "json", "html", "css", "yaml", "lua" },
  callback = function()
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Auto-close terminal buffer when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group    = augroup("term_close"),
  callback = function() vim.cmd("bdelete!") end,
})

-- Resize splits when the window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group    = augroup("resize_splits"),
  callback = function() vim.cmd("tabdo wincmd =") end,
})

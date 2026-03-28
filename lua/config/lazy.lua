-- ============================================================
--  config/lazy.lua — bootstrap Lazy.nvim and load plugins
-- ============================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },          -- loads every file in lua/plugins/
  },
  defaults = { lazy = true },        -- lazy-load everything unless told otherwise
  install  = { colorscheme = { "catppuccin", "habamax" } },
  checker  = { enabled = true, notify = false },  -- silent update checks
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    icons  = {
      cmd    = "⌘",  config  = "🛠",
      event  = "📅", ft      = "📂",
      init   = "⚙",  keys    = "🗝",
      plugin = "🔌", runtime = "💻",
      source = "📄", start   = "🚀",
      task   = "📌",
    },
  },
})

-- Convenience binding to open Lazy UI
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy plugin manager" })

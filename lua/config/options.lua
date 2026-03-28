-- ============================================================
--  config/options.lua — vanilla vim options
-- ============================================================

local opt          = vim.opt

-- UI
opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes" -- always show, avoids layout shift
opt.cursorline     = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.termguicolors  = true
opt.showmode       = false -- mode shown by statusline instead
opt.cmdheight      = 1
opt.pumheight      = 12    -- max items in completion popup
opt.hidden         = true
opt.autowrite      = false
opt.fillchars      = { eob = " " }
-- Indentation
opt.expandtab      = true
opt.shiftwidth     = 4
opt.tabstop        = 4
opt.softtabstop    = 4
opt.smartindent    = true

-- Search
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = true
opt.incsearch      = true

-- Files & undo
opt.backup         = false
opt.swapfile       = false
opt.undofile       = true
opt.undodir        = vim.fn.stdpath("data") .. "/undo"

-- Splits
opt.splitbelow     = true
opt.splitright     = true

-- Completion
opt.completeopt    = { "menu", "menuone", "noselect" }
opt.shortmess:append("c") -- don't show 'match x of y' in ins-completion

-- Misc
opt.wrap         = false
opt.mouse        = "a"
opt.clipboard    = "unnamedplus" -- sync with system clipboard
opt.updatetime   = 200
opt.timeoutlen   = 400
opt.encoding     = "utf-8"
opt.fileencoding = "utf-8"

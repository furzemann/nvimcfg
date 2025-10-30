-- Custom bright color theme for transparent backgrounds

local neon = {}

neon.setup = function()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = "neonbright"

  -- Define your palette
  local c = {
    bg = "none", -- transparent background
    fg = "#E0E0E0",
    cyan = "#00FFFF",
    pink = "#FF69B4",
    orange = "#FFA500",
    green = "#39FF14",
    yellow = "#FFFF00",
    red = "#FF5555",
    purple = "#B26BFF",
    blue = "#33CCFF",
  }

  -- Editor
  vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = c.orange })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.yellow, bold = true })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#444444" })
  vim.api.nvim_set_hl(0, "StatusLine", { fg = c.cyan, bg = "#202020", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = c.bg })

  vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
  vim.api.nvim_set_hl(0, "Constant", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "String", { fg = c.green })
  vim.api.nvim_set_hl(0, "Character", { fg = c.green })
  vim.api.nvim_set_hl(0, "Number", { fg = c.orange })
  vim.api.nvim_set_hl(0, "Boolean", { fg = c.orange })
  vim.api.nvim_set_hl(0, "Identifier", { fg = c.pink })
  vim.api.nvim_set_hl(0, "Function", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Statement", { fg = c.purple, bold = true })
  vim.api.nvim_set_hl(0, "PreProc", { fg = c.blue })
  vim.api.nvim_set_hl(0, "Type", { fg = c.cyan, bold = true })
  vim.api.nvim_set_hl(0, "Special", { fg = c.red })
  vim.api.nvim_set_hl(0, "Todo", { fg = c.yellow, bg = "#333300", bold = true })
end

neon.setup()
return neon

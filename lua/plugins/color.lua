return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      glow = true,
      transparent = true,
      highlights = {
        Comment = { fg = "#ffffff", bg = "NONE", italic = true },
      },
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "cyberdream" } },
}

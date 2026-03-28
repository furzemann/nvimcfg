-- ============================================================
--  plugins/extras.lua — quality-of-life additions
-- ============================================================

return {
  -- ── Plenary: async + test utils (dep of many plugins) ────
  { "nvim-lua/plenary.nvim", lazy = true },

  -- ── Web devicons ─────────────────────────────────────────
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ── Better % matching (if/else, HTML tags, etc.) ─────────
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    init  = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
  },

  -- ── Surround: ys, cs, ds motions ─────────────────────────
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
  },

  -- ── Mini.move: alt+hjkl to move lines/blocks ─────────────
  {
    "echasnovski/mini.move",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
  },

  -- ── Colorizer: show color codes as colored bg ────────────
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts  = { user_default_options = { tailwind = true } },
  },

  -- ── Todo comments: highlight TODO/FIXME/HACK/etc. ────────
  {
    "folke/todo-comments.nvim",
    cmd          = { "TodoTrouble", "TodoTelescope" },
    event        = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
      { "]t",  function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t",  function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
    },
    opts = {},
  },

  -- ── Flash: fast cursor jump (replaces Hop/EasyMotion) ────
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys  = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,             desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
    opts = {},
  },

  -- ── Oil.nvim: edit your filesystem like a buffer ─────────
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent dir (Oil)" },
    },
    opts = {},
  },
}

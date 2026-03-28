-- ============================================================
--  plugins/ui.lua — statusline, file tree, git, which-key
-- ============================================================

return {
  -- ── Statusline ───────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    event        = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme                = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        globalstatus         = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },   -- relative path
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ── File tree ────────────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    version      = "*",
    cmd          = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File tree" },
      { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal in tree" },
    },
    opts = {
      view     = { width = 32 },
      renderer = { group_empty = true },
      filters  = { dotfiles = false },
      git      = { enable = true, ignore = false },
    },
  },

  -- ── Git decorations in the gutter ────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts  = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs  = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk,    "Next hunk")
        map("n", "[h", gs.prev_hunk,    "Prev hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk,       "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk,       "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer,     "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk,  "Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer,     "Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk,     "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>hd", gs.diffthis,         "Diff this")
      end,
    },
  },

  -- ── Which-key: shows pending keybinding completions ──────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ window = { border = "rounded" } })
      -- Register group labels
      wk.register({
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>h"] = { name = "+hunks" },
        ["<leader>w"] = { name = "+workspace" },
        ["<leader>d"] = { name = "+diagnostics" },
      })
    end,
  },

  -- ── Autopairs ────────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts  = { check_ts = true },   -- use treesitter to avoid pairing in strings/comments
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)
      -- Make autopairs play nice with cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- ── Comment toggling ─────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},    -- default mappings: gcc (line), gbc (block), gc/gb in visual
  },

  -- ── Better buffer tabs ───────────────────────────────────
  {
    "akinsho/bufferline.nvim",
    event        = "VeryLazy",
    version      = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics              = "nvim_lsp",
        always_show_bufferline   = false,
        offsets = {
          {
            filetype   = "NvimTree",
            text       = "File Explorer",
            highlight  = "Directory",
            separator  = true,
          },
        },
      },
    },
  },

  -- ── Indent guides ────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main  = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {
      indent  = { char = "│" },
      scope   = { enabled = true },
    },
  },

  -- ── Trouble: pretty diagnostics list ─────────────────────
  {
    "folke/trouble.nvim",
    cmd          = { "Trouble", "TroubleToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix list" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location list" },
    },
    opts = { use_diagnostic_signs = true },
  },
}

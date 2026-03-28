-- ============================================================
--  plugins/treesitter.lua — syntax, indentation, text objects
-- ============================================================

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build        = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config       = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed      = {
          "lua", "vim", "vimdoc",
          "rust", "c", "cpp",
          "javascript", "typescript", "tsx",
          "go",
          "python",
          "json", "yaml", "toml",
          "html", "css",
          "bash", "markdown", "markdown_inline",
        },
        auto_install          = true,
        highlight             = { enable = true },
        indent                = { enable = true },
        incremental_selection = {
          enable  = true,
          keymaps = {
            init_selection    = "<C-space>",
            node_incremental  = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental  = "<M-space>",
          },
        },
        textobjects           = {
          select = {
            enable    = true,
            lookahead = true,
            keymaps   = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable              = true,
            set_jumps           = true,
            goto_next_start     = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
            goto_next_end       = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
            goto_previous_end   = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
          },
          swap = {
            enable        = true,
            swap_next     = { ["<leader>a"] = "@parameter.inner" },
            swap_previous = { ["<leader>A"] = "@parameter.inner" },
          },
        },
      })
    end,
  },
}

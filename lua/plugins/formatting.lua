-- ============================================================
--  plugins/formatting.lua — conform.nvim + nvim-lint
-- ============================================================

return {
  -- ── Formatter ───────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd   = { "ConformInfo" },
    keys  = {
      {
        "<leader>F",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        desc = "Format buffer (conform)",
      },
    },
    opts = {
      formatters_by_ft = {
        lua        = { "stylua" },
        python     = { "isort", "black" },
        rust       = { "rustfmt" },
        go         = { "goimports", "gofumpt" },
        javascript  = { "prettierd", "prettier" },
        typescript  = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json       = { "prettierd", "prettier" },
        yaml       = { "prettierd", "prettier" },
        markdown   = { "prettierd", "prettier" },
        cpp        = { "clang_format" },
        c          = { "clang_format" },
      },
      format_on_save = {
        timeout_ms   = 500,
        lsp_fallback = true,
      },
    },
  },

  -- ── Linter ──────────────────────────────────────────────
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        python     = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        go         = { "golangcilint" },
      }

      -- Run linters on save and after leaving insert mode
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}

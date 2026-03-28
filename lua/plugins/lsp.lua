-- ============================================================
--  plugins/lsp.lua — FIXED & MODERN
-- ============================================================

local servers = {
  -- ❌ rust_analyzer removed (handled separately)

  -- C / C++
  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
      "--query-driver=/usr/bin/g++",
    },
  },

  gdscript = {
    cmd = { "nc", "127.0.0.1", "6005" },
    filetypes = { "gd", "gdscript", "gdscript3" },
  },
  -- TypeScript
  ts_ls = {},

  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = { unusedparams = true, shadow = true },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  -- Python
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoImportCompletions = true,
        },
      },
    },
  },

  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
        diagnostics = { globals = { "vim" } },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

-- ── on_attach ───────────────────────────────────────────────
local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gt", vim.lsp.buf.type_definition)

  map("n", "K", vim.lsp.buf.hover)
  map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help)

  map("n", "<leader>ca", vim.lsp.buf.code_action)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
end

-- ── diagnostics ─────────────────────────────────────────────
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "always" },
})

-- ── plugins ─────────────────────────────────────────────────
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>M", "<cmd>Mason<cr>" } },
    opts = { ui = { border = "rounded" } },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for server, opts in pairs(servers) do
        opts.on_attach = on_attach
        opts.capabilities = capabilities

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end
    end
  },

  -- 🦀 Proper Rust setup (modern)
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
}

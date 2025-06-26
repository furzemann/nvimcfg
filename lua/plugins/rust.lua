return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").rust_analyzer.setup({})
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- optional keybinds
          end,
          cmd = { "C:\\Users\\sinha\\.rustup\\toolchains\\stable-x86_64-pc-windows-msvc\\bin\\rust-analyzer.exe" }, -- optionally set path if it's not in PATH
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  },
}

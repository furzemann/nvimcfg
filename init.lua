-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load()

require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

require("lspconfig").clangd.setup({})
require("config.floaterm")

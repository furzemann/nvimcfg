return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- optional
    build = (vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0) and nil or "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "rafamadriz/friendly-snippets" },
}

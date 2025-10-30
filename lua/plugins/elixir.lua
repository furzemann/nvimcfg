return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          cmd = { "/home/freeze/.local/share/elixir-ls/language_server.sh" },
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = false,
            },
          },
        },
      },
    },
  },
}

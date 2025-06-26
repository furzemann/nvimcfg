return {
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
          end,
        },
      })
    end,
  },
}

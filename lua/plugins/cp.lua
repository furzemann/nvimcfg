-- in lua/plugins/cp.lua
return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("competitest").setup({
        force_default = true,
        runner = "cpp",
      })
    end,
    ft = { "cpp", "c", "java", "py" },
  },
  {
    "A7lavinraj/assistant.nvim",
    lazy = false,
    config = function()
      require("assistant").setup({})
    end,
    ft = { "cpp", "c", "py", "java" },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
            "--query-driver=*g++*",
          },
          filetypes = { "c", "cpp" },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- ✅ Try standard roots first
            return util.root_pattern("compile_commands.json", "compile_flags.txt", "Makefile", ".git")(fname)
              -- ✅ Fallback: use file’s own directory so clangd always starts
              or util.path.dirname(fname)
          end,
        },
      },
    },
  },
}

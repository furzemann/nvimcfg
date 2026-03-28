return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim" },
    config = function()
      require("competitest").setup({
        force_default = true,
        runner = "cpp",
      })
    end,
    ft = { "cpp", "c", "java", "py" },
  },
}

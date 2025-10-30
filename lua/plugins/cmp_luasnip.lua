return {
  "hrsh7th/nvim-cmp",
  dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Add LuaSnip to the list of completion sources
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "luasnip" },
    }))

    -- (Optional) Automatically expand snippets when selected
    opts.mapping["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })

    return opts
  end,
}

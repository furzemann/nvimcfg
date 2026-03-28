return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 🖼️ Header (you can change this)
    dashboard.section.header.val = {
      " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      " ████╗  ██║██║   ██║██║████╗ ████║",
      " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
    }

    -- 🔘 Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- 🧠 Footer
    dashboard.section.footer.val = "good luck on codeforces :)"

    -- spacing
    dashboard.config.layout[1].val = 5

    alpha.setup(dashboard.config)
  end,
}

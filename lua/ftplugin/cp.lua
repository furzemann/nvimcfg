-- lua/ftplugin/cpp.lua
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map(
  "n",
  "<leader>rr",
  ":w | :TermExec cmd='g++ -std=gnu17 -O2 % -o %< && ./ %<' size=50 direction=tab go_back=0<CR>",
  { desc = "Compile & run C++ CP file" }
)
map(
  "n",
  "<leader>rt",
  ":w | :TermExec cmd='g++ -std=gnu17 -O2 % -o %< && ./ %< < input.txt' size=50 direction=tab go_back=0<CR>",
  { desc = "Compile & run with input.txt" }
)

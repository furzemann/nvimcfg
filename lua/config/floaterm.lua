vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = { buf = -1, win = -1 },
}

local function open_floating_win(args)
  local width = vim.o.columns
  local height = vim.o.lines
  local win_width = math.floor(width * 0.8)
  local win_height = math.floor(height * 0.8)
  local col = math.floor((width - win_width) / 2)
  local row = math.floor((height - win_height) / 2)

  local buf
  if args and args.buf and vim.api.nvim_buf_is_valid(args.buf) then
    buf = args.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  return { buf = buf, win = win }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_win({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_close(state.floating.win, true)
    state.floating = { buf = state.floating.buf, win = -1 }
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)

require('nnn').setup({
  explorer = {
    cmd = "nnn",
    width = 75,
    side = "botright",
    session = "local",
    tabs = false
  },
  picker = {
    cmd = "nnn",
    style = {
			width = 0.9,     -- percentage relative to terminal size when < 1, absolute otherwise
			height = 0.8,    -- ^
			xoffset = 0.5,   -- ^
			yoffset = 0.5,   -- ^
			border = "rounded"-- border decoration for example "rounded"(:h nvim_open_win)
		},
    session = "local"
  }
})

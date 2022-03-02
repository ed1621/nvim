require('gitsigns').setup {
   keymaps = {
      -- Default keymap options
      buffer = true,
      noremap = true,
      ["n <leader>nh"] = { expr = true, "&diff ? '<leader>nh' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ["n <leader>ph"] = { expr = true, "&diff ? '<leader>ph' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
      ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
   },
   numhl = false,

   sign_priority = 5,
   signs = {
      add = {},
      change = {},
      changedelete = {},
      delete = {},
      topdelete = {},
   },

   status_formatter = nil, -- Use default
   watch_gitdir = {
      interval = 100,
   },
}

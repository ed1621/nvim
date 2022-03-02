local opt = vim.opt
local g = vim.g

opt.completeopt = 'menuone,noinsert,noselect'
opt.ai = true -- auto-indent
opt.vb = true -- visual bell
opt.number = true -- line numvbrs
opt.encoding = 'utf-8'
opt.spellfile=vim.env.NVIM_HOME .. '/spell/en.utf-8.add'
opt.tabstop = 2 -- spaces that <Tab> uses
opt.softtabstop = 2
opt.shiftwidth = 2 -- spaces to indent
opt.expandtab = true
opt.cursorline = true
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.syntax = "true"
opt.autoread = true

vim.cmd[[set noshowmode]]
vim.cmd[[set noruler]]
vim.cmd[[set nowrap]]
vim.cmd[[set cmdheight=1]]
vim.cmd[[let &fcs='eob: ']]

-- disable builtin vim plugins
g.loaded_gzip = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_spec = 0

g.dashboard_default_executive = 'telescope'

g.rooter_patterns = { '.git', 'build.sbt' }

vim.notify = require("notify")

-- neon theme
g.neon_style = 'doom'
g.neon_italic_comment = 1
g.neon_italic_keyword = 0
g.neon_italic_boolean = 0
g.neon_italic_function = 0
g.neon_italic_variable = 0
g.neon_bold = 1

vim.cmd[[hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold]]
vim.cmd[[hi link CalNavi CalRuler]]
vim.cmd[[hi tkTagSep ctermfg=gray guifg=gray]]
vim.cmd[[hi tkTag ctermfg=175 guifg=#d3869B]]

vim.cmd[[let test#strategy = "neovim"]]
vim.cmd[[let test#neovim#term_position = "15"]]
vim.cmd[[let g:ultest_use_pty = 1]]

(import-macros {: set! 
                : let! } :macros)
(let! mapleader " ")

(set! completeopt "menuone,noinsert,noselect")
(set! ai true) ;;auto-indent
(set! vb true) ;;visual bell
(set! number)
(set! encoding "utf-8")
(set! spellfile (.. vim.env.NVIM_HOME "/spell/en.utf-8.add"))
(set! tabstop 2) ;; spaces that <tab> uses
(set! softtabstop 2)
(set! shiftwidth 2) ;; spaces to indent
(set! expandtab true)
(set! cursorline true)
(set! termguicolors true)
(set! splitright true)
(set! splitbelow true)
(set! hidden true)
(set! syntax "true")
(set! autoread true)

(set! noshowmode)
(set! noruler)
(set! nowrap)
(set! cmdheight 1)
(let! &fcs "eob: ")

(vim.cmd "hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold")
(vim.cmd "hi link CalNavi CalRuler")
(vim.cmd "hi tkTagSep ctermfg=gray guifg=gray")
(vim.cmd "hi tkTag ctermfg=175 guifg=#d3869B")


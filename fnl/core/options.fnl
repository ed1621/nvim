(require-macros :hibiscus.vim)

(set! syntax :true)
(set! completeopt "menuone,noinsert,noselect")
(set! encoding :utf-8)
(set! noshowmode)
(set! noruler)
(set! nowrap)
(set! cmdheight 1)
; (set! &fcs "eob: ")

(g! loaded_gzip 0)
(g! loaded_tar 0)
(g! loaded_tarPlugin 0)
(g! loaded_zipPlugin 0)
(g! loaded_2html_plugin 0)
(g! loaded_netrw 0)
(g! loaded_netrwPlugin 0)
(g! loaded_matchit 0)
; (g! loaded_matchparen 0)
(g! loaded_gzip 0)
(g! loaded_spec 0)

; (g! dashboard_default_executive :telescope)
; (g! rooter_patterns [".git" "build.sbt"]

(each [_ opt (ipairs [
  "number"
  "ai"
  "vb"
  "expandtab"
  "cursorline"
  "termguicolors"
  "splitright"
  "splitbelow"
  "hidden"
  "autoread"
])] (set! opt true))

(each [_ opt (ipairs [
  "tabstop" 
  "softtabstop" 
  "shiftwidth"
])] (set! opt 2))

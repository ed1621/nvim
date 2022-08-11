(import-macros {: fstring} :hibiscus.core)
(import-macros {: set!} :hibiscus.vim)

(local {: insert} table)
(local {: setup
        : mapping
        : visible
        : select_prev_item
        : select_next_item
        : complete
        :config {: compare : disable}
        :ItemField {:Kind kind :Abbr abbr :Menu menu}
        :SelectBehavior {:Insert insert-behavior :Select select-behavior}} (require :cmp))

(local types (require :cmp.types))
(local under-compare (require :cmp-under-comparator))
(local {: lsp_expand
        : expand_or_jump
        : expand_or_jumpable
        : jump
        : jumpable} (require :luasnip))

(local icons {:Text ""
                 :Method ""
                 :Function ""
                 :Constructor ""
                 :Field "ﰠ"
                 :Variable ""
                 :Class "ﴯ"
                 :Interface ""
                 :Module ""
                 :Property "ﰠ"
                 :Unit "塞"
                 :Value ""
                 :Enum ""
                 :Keyword ""
                 :Snippet ""
                 :Color ""
                 :File ""
                 :Reference ""
                 :Folder ""
                 :EnumMember ""
                 :Constant ""
                 :Struct "פּ"
                 :Event ""
                 :Operator ""
                 :TypeParameter ""})
 
(set! completeopt "menu,menuone,preview,noinsert")

(fn has-words-before []
  (let [col (- (vim.fn.col ".") 1)
            ln (vim.fn.getline ".")]
    (or (= col 0) (string.match (string.sub ln col col) "%s"))))

(fn replace-termcodes [code]
  (vim.api.nvim_replace_termcodes code true true true))

(setup {:preselect types.cmp.PreselectMode.None
        :experimental {:ghost_text true}
        :window {:documentation {:border :solid} :completion {:border :solid}}
        :snippet {:expand (fn [args]
                            (lsp_expand args.body))}
        :mapping {:<C-b> (mapping.scroll_docs -4)
                  :<C-f> (mapping.scroll_docs 4)
                  :<C-e (mapping.abort)
                  :<C-n> (mapping (mapping.select_next_item {:behavior insert-behavior}) [:i :s])
                  :<C-p> (mapping (mapping.select_prev_item {:behavior insert-behavior}) [:i :s])
                  :<Tab> (mapping (fn [fallback]
                                    (if (visible)
                                        (select_next_item {:behavior insert-behavior})
                                        (expand_or_jumpable)
                                        (expand_or_jump)
                                        (has-words-before)
                                        (vim.fn.feedkeys (replace-termcodes :<Tab>)
                                                         :n)
                                        (fallback)))
                                  [:i :s :c])
                  :<S-Tab> (mapping (fn [fallback]
                                      (if (visible)
                                          (select_prev_item {:behavior insert-behavior})
                                          (jumpable -1)
                                          (jump -1)
                                          (fallback)))
                                    [:i :s :c])
                  :<C-Space> (mapping.confirm {:select true})}
        :sources [{:name :nvim_lsp}
                  {:name :luasnip}
                  {:name :path}
                  {:name :buffer :option {:keyword_pattern "\\k\\+"}}
                  {:name :conjure}
                  {:name :crates}]
        :sorting {:comparators [compare.offset
                                 compare.exact
                                 compare.score
                                 under-compare.under
                                 compare.kind
                                 compare.sort_text
                                 compare.length
                                 compare.order]}
        :formatting {:fields {1 :kind 2 :abbr 3 :menu}
                     :format (fn [_ vim-item]
                               (set vim-item.menu vim-item.kind)
                               (set vim-item.kind (. icons vim-item.kind))
                               vim-item)}})
                  
; (let [cmp (require :cmp)
      ; lsp-icons {}
;       menu-items {:nvim_lsp "[LSP]"
;                   :buffer "[BUF]"
;                   :vsnip "[VSNIP]"
;                   :path "[PATH]"}]
;   (cmp.setup {:sources [{:name :nvim_lsp :priority 10}
;                         {:name :vsnip}
;                         {:name :path}]
;               :snippet {:expand (fn [args]
;                                   (vim.fn.vsnip#anonymous args.body))}
;               :mapping {:<CR> (cmp.mapping.confirm {:select true})
;                         :<Tab> (fn [fallback]
;                                  (if (cmp.visible)
;                                      (cmp.select_next_item)
;                                      (fallback)))
;                         :S-Tab (fn [fallback]
;                                  (if (cmp.visible)
;                                      (cmp.select_prev_item)
;                                      (fallback)))}
;               :formatting {:format (fn [entry vim_item]
;                                      (lua "vim_item.kind = string.format(\"%s %s\", lsp_icons[vim_item.kind], vim_item.kind)")
;                                      (lua "vim_item.menu = (menu-items)[entry.source.name]")
;                                      vim_item)}}))

(let [telescope (require :telescope)
      sorters (require :telescope.sorters)
      previewers (require :telescope.previewers)]
  (telescope.setup {:defaults {:path_display [:smart]
                               :vimgrep_arguments [:rg
                                                   :--color=never
                                                   :--hidden
                                                   :--no-heading
                                                   :--with-filename
                                                   :--line-number
                                                   :--column
                                                   :--smart-case]
                               :file_ignore_patterns [:target
                                                      :project/project
                                                      :.bsp
                                                      :.git/
                                                      :.idea
                                                      :.bloop
                                                      :.DS_Store
                                                      :.metals/
                                                      :^out$
                                                      :node_modules
                                                      :__pycache__
                                                      :venv]
                               :initial_mode :insert
                               :prompt_prefix "❯ "
                               :sorting_strategy :ascending
                               :layout_strategy :horizontal
                               :layout_config {:horizontal {:prompt_position :top
                                                            :preview_width 0.55
                                                            :results_width 0.8}
                                               :vertical {:mirror false}
                                               :width 0.87
                                               :height 0.8
                                               :preview_cutoff 120}
                               :winblend 0
                               :border {}
                               :borderchars ["─"
                                             "│"
                                             "─"
                                             "│"
                                             "╭"
                                             "╮"
                                             "╯"
                                             "╰"]
                               :color_devicons true
                               :use_less true
                               :set_env {:COLORTERM :truecolor}}
                    :pickers {:find_files {:hidden true}}}))

(let [null-ls (require :null-ls)
      builtins (require :null-ls.builtins)]
  (null-ls.setup 
    {:sources [builtins.code_actions.shellcheck
               builtins.diagnostics.shellcheck
               builtins.formatting.shellharden
               builtins.formatting.shfmt
               builtins.formatting.fnlfmt]}))

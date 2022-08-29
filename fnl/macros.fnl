(λ expr->str [expr]
  `(macrodebug ,expr nil))

(fn nil? [x]
  (= nil x))

(fn str? [x]
  (= :string (type x)))

(fn num? [x]
  (= :number (type x)))

(fn bool? [x]
  (= :boolean (type x)))

(fn fn? [x]
  (= :function (type x)))

(fn tbl? [x]
  (= :table (type x)))

(fn ->str [x]
  (tostring x))

(fn ->bool [x]
  (if x true false))

(fn keys [t]
  (let [result []]
    (when t
      (each [k _ (pairs t)]
        (table.insert result k)))
    result))

(λ empty? [xs]
  "Check if given table is empty"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (= 0 (length xs)))

(λ first [xs]
  "Get the first element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs 1))

(λ second [xs]
  "Get the second element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs 2))

(λ last [xs]
  "Get the last element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs (length xs)))

(λ count [xs]
  "Count the number of items in a table"
  (if
    (table? xs) (let [maxn (table.maxn xs)]
                  (if (= 0 maxn)
                    (table.maxn (keys xs))
                    maxn))
    (not xs) 0
    (length xs)))

(λ any? [pred xs]
  (accumulate [any? false
               _ v (ipairs xs)
               :until any?]
    (pred v)))

(λ all? [pred xs]
  (not (any? #(not (pred $)) xs)))

(λ contains? [xs x]
  (any? #(= $ x) xs))

(λ flatten [x ?levels]
  (assert (tbl? x) "expected tbl for x")
  (assert (or (nil? ?levels) (num? ?levels)) "expected number or nil for levels")
  (if (or (nil? ?levels) (> ?levels 0))
    (accumulate [output []
                 _ v (ipairs x)]
      (if (tbl? v)
        (icollect [_ v (ipairs (flatten v (if (nil? ?levels) nil (- ?levels 1)))) :into output] v)
        (doto output (table.insert v))))
    x))

(fn begins-with? [chars str]
  "Return whether str begins with chars."
  (->bool (str:match (.. "^" chars))))

(fn djb2 [str]
  "Implementation of the hash function djb2.
  Extracted the implementation from <https://theartincode.stanis.me/008-djb2/>."
  (let [bytes (icollect [char (str:gmatch ".")] (string.byte char))
        hash (accumulate [hash 5381
                          _ byte (ipairs bytes)]
               (+ byte hash (bit.lshift hash 5)))]
    (bit.tohex hash)))

(λ gensym-checksum [x ?options]
  "Generates a new symbol from the checksum of the object passed as a parameter
  after it is casted into an string using the `view` function.
  You can also pass a prefix or a suffix into the options optional table.
  This function depends on the djb2 hash function."
  (let [options (or ?options {})
        prefix (or options.prefix "")
        suffix (or options.suffix "")]
    (sym (.. prefix (djb2 (view x)) suffix))))

(fn fn? [x]
  "Checks if `x` is a function definition.
  Cannot check if a symbol is a function in compile time."
  (and (list? x)
       (or (= 'fn (first x))
           (= 'hashfn (first x))
           (= 'lambda (first x))
           (= 'partial (first x)))))

(fn quoted? [x]
  "Check if `x` is a list that begins with `quote`."
  (and (list? x)
       (= 'quote (first x))))

(λ quoted->fn [expr]
  "Converts an expression like `(quote (+ 1 1))` into `(fn [] (+ 1 1))`."
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (second expr)]
    `(fn [] ,non-quoted)))

(λ quoted->str [expr]
  "Converts a quoted expression like `(quote (+ 1 1))` into an string with its shorthand form."
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (second expr)]
    (.. "'" (view non-quoted))))

(λ expand-exprs [exprs]
  "Converts a list of expressions into either an expression - if only one
  expression is in the list - or a do-expression containing the expressions."
  (if (> (length exprs) 1)
    `(do
       ,(unpack exprs))
    (first exprs)))

(λ vlua [x]
  "Return a symbol mapped to `v:lua.%s()` where `%s` is the symbol."
  (assert-compile (sym? x) "expected symbol for x" x)
  (string.format "v:lua.%s()" (->str x)))

(λ colorscheme [scheme]
  "Set a colorscheme using the vim.api.nvim_cmd API.
  Accepts the following arguements:
  scheme -> a symbol.
  Example of use:
  ```fennel
  (colorscheme carbon)
  ```"
  (assert-compile (sym? scheme) "expected symbol for name" scheme)
  (let [scheme (->str scheme)]
    `(vim.api.nvim_cmd {:cmd :colorscheme :args [,scheme]} {})))

(λ custom-set-face! [name attributes colors]
  "Sets a highlight group globally using the vim.api.nvim_set_hl API.
  Accepts the following arguments:
  name -> a symbol.
  attributes -> a list of boolean attributes:
    - bold
    - italic
    - reverse
    - inverse
    - standout
    - underline
    - underlineline
    - undercurl
    - underdot
    - underdash
    - strikethrough
    - default
  colors -> a table of colors:
    - fg
    - bg
    - ctermfg
    - ctermbg
  Example of use:
  ```fennel
  (custom-set-face! Error [:bold] {:fg \"#ff0000\"})
  ```
  That compiles to:
  ```fennel
  (vim.api.nvim_set_hl 0 \"Error\" {:fg \"#ff0000\"
                                    :bold true})
  ```"
  (assert-compile (sym? name) "expected symbol for name" name)
  (assert-compile (tbl? attributes) "expected table for attributes" attributes)
  (assert-compile (tbl? colors) "expected colors for colors" colors)
  (let [name (->str name)
        definition (collect [_ attr (ipairs attributes)
                             :into colors]
                     (->str attr) true)]
    `(vim.api.nvim_set_hl 0 ,name ,definition)))

(λ set! [name ?value]
  "Set a vim option using the vim.opt.<name> API.
  Accepts the following arguments:
  name -> must be a symbol.
          - If it ends with '+' it appends to the current value.
          - If it ends with '-' it removes from the current value.
          - If it ends with with '^' it prepends to the current value.
  value -> anything.
           - If it is not specified, whether the name begins with 'no' is used
             as a boolean value.
           - If it is a quoted expression or a function it becomes
             v:lua.<symbol>()."
  (assert-compile (sym? name) "expected symbol for name" name)
  (let [name (->str name)
        value (if (nil? ?value)
                  (not (begins-with? :no name))
                  ?value)
        value (if (quoted? value)
                (quoted->fn value)
                value)
        name (if (and (nil? ?value) (begins-with? :no name))
               (name:match "^no(.+)$")
               name)
        exprs (if (fn? value)
                [`(tset _G ,(->str (gensym-checksum value {:prefix "__"})) ,value)]
                [])
        value (if (fn? value)
                (vlua (gensym-checksum value {:prefix "__"}))
                value)
        exprs (doto exprs
                    (table.insert (match (name:sub -1)
                                    "+" `(: (. vim.opt ,(name:sub 1 -2)) :append ,value)
                                    "-" `(: (. vim.opt ,(name:sub 1 -2)) :remove ,value)
                                    "^" `(: (. vim.opt ,(name:sub 1 -2)) :prepend ,value)
                                    _ `(tset vim.opt ,name ,value))))]
    (expand-exprs exprs)))

(λ local-set! [name ?value]
  "Set a vim option using the vim.opt_local.<name> API.
  Accepts the following arguments:
  name -> must be a symbol.
          - If it ends with '+' it appends to the current value.
          - If it ends with '-' it removes from the current value.
          - If it ends with with '^' it prepends to the current value.
  value -> anything.
           - If it is not specified, whether the name begins with 'no' is used
             as a boolean value.
           - If it is a quoted expression or a function it becomes
             v:lua.<symbol>()."
  (assert-compile (sym? name) "expected symbol for name" name)
  (let [name (->str name)
        value (if (nil? ?value)
                  (not (begins-with? :no name))
                  ?value)
        value (if (quoted? value)
                (quoted->fn value)
                value)
        name (if (and (nil? ?value) (begins-with? :no name))
               (name:match "^no(.+)$")
               name)
        exprs (if (fn? value)
                [`(tset _G ,(->str (gensym-checksum value {:prefix "__"})) ,value)]
                [])
        value (if (fn? value)
                (vlua (gensym-checksum value {:prefix "__"}))
                value)
        exprs (doto exprs
                    (table.insert (match (name:sub -1)
                                    "+" `(: (. vim.opt_local ,(name:sub 1 -2)) :append ,value)
                                    "-" `(: (. vim.opt_local ,(name:sub 1 -2)) :remove ,value)
                                    "^" `(: (. vim.opt_local ,(name:sub 1 -2)) :prepend ,value)
                                    _ `(tset vim.opt_local ,name ,value))))]
    (expand-exprs exprs)))

(λ shared-command! [api-function name command ?options]
  (assert-compile (sym? api-function) "expected symbol for api-function" api-function)
  (assert-compile (sym? name) "expected symbol for name" name)
  (assert-compile (or (str? command) (sym? command) (fn? command) (quoted? command)) "expected string, symbol, function or quoted expression for command" command)
  (assert-compile (or (nil? ?options) (tbl? ?options)) "expected table for options" ?options)
  (let [name (->str name)
        options (or ?options {})
        options (if (nil? options.desc)
                  (doto options (tset :desc (if (quoted? command) (quoted->str command)
                                              (str? command) command
                                              (view command))))
                  options)
        command (if (quoted? command) (quoted->fn command) command)]
    `(,api-function ,name ,command ,options)))

(λ command! [name command ?options]
  "Create a new user command using the vim.api.nvim_create_user_command API.

  Accepts the following arguments:
  name -> must be a symbol.
  command -> can be an string, a symbol, a function or a quoted expression.
  options -> a table of options. Optional. If the :desc option is not specified
             it will be inferred.

  Example of use:
  ```fennel
  (command! Salute '(print \"Hello World\")
            {:bang true :desc \"This is a description\"})
  ```
  That compiles to:
  ```fennel
  (vim.api.nvim_create_user_command \"Salute\" (fn [] (print \"Hello World\"))
                                    {:bang true
                                     :desc \"This is a description\"})
  ```"
  (shared-command! 'vim.api.nvim_create_user_command name command ?options))

(λ local-command! [name command ?options]
  "Create a new user command using the vim.api.nvim_buf_create_user_command API.

  Accepts the following arguments:
  name -> must be a symbol.
  command -> can be an string, a symbol, a function or a quoted expression.
  options -> a table of options. Optional. If the :desc option is not specified
             it will be inferred.

  Example of use:
  ```fennel
  (local-command! Salute '(print \"Hello World\")
                  {:bang true :desc \"This is a description\"})
  ```
  That compiles to:
  ```fennel
  (vim.api.nvim_buf_create_user_command \"Salute\" (fn [] (print \"Hello World\"))
                                        {:bang true
                                         :desc \"This is a description\"})
  ```"
  (shared-command! 'vim.api.nvim_buf_create_user_command name command ?options))

(λ autocmd! [event pattern command ?options]
  "Create an autocommand using the nvim_create_autocmd API.

  Accepts the following arguments:
  event -> can be either a symbol or a list of symbols.
  pattern -> can be either a symbol or a list of symbols. If it's <buffer> the
             buffer option is set to 0. If the buffer option is set this value
             is ignored.
  command -> can be an string, a symbol, a function or a quoted expression.
  options -> a table of options. Optional. If the :desc option is not specified
             it will be inferred.

  Example of use:
  ```fennel
  (autocmd! VimEnter *.py '(print \"Hello World\")
            {:once true :group \"custom\" :desc \"This is a description\"})
  ```
  That compiles to:
  ```fennel
  (vim.api.nvim_create_autocmd :VimEnter
                               {:pattern \"*.py\"
                                :callback (fn [] (print \"Hello World\"))
                                :once true
                                :group \"custom\"
                                :desc \"This is a description\"})
  ```"
  (assert-compile (or (sym? event) (and (tbl? event) (all? #(sym? $) event)) "expected symbol or list of symbols for event" event))
  (assert-compile (or (sym? pattern) (and (tbl? pattern) (all? #(sym? $) pattern)) "expected symbol or list of symbols for pattern" pattern))
  (assert-compile (or (str? command) (sym? command) (fn? command) (quoted? command)) "expected string, symbol, function or quoted expression for command" command)
  (assert-compile (or (nil? ?options) (tbl? ?options)) "expected table for options" ?options)
  (let [event (if (and (tbl? event) (not (sym? event)))
                (icollect [_ v (ipairs event)] (->str v))
                (->str event))
        pattern (if (and (tbl? pattern) (not (sym? pattern)))
                  (icollect [_ v (ipairs pattern)] (->str v))
                  (->str pattern))
        options (or ?options {})
        options (if (nil? options.buffer)
                  (if (= "<buffer>" pattern)
                    (doto options (tset :buffer 0))
                    (doto options (tset :pattern pattern)))
                  options)
        options (if (str? command)
                  (doto options (tset :command command))
                  (doto options (tset :callback (if (quoted? command)
                                                  (quoted->fn command)
                                                  command))))
        options (if (nil? options.desc)
                  (doto options (tset :desc (if (quoted? command) (quoted->str command)
                                              (str? command) command
                                              (view command))))
                  options)]
    `(vim.api.nvim_create_autocmd ,event ,options)))

(λ augroup! [name ...]
  "Create an augroup using the nvim_create_augroup API.
  Accepts either a name or a name and a list of autocmd statements.

  Example of use:
  ```fennel
  (augroup! a-nice-group
    (autocmd! Filetype *.py '(print \"Hello World\"))
    (autocmd! Filetype *.sh '(print \"Hello World\")))
  ```
  That compiles to:
  ```fennel
  (do
    (vim.api.nvim_create_augroup \"a-nice-group\" {:clear false})
    (autocmd! Filetype *.py '(print \"Hello World\") {:group \"a-nice-group\"})
    (autocmd! Filetype *.sh '(print \"Hello World\") {:group \"a-nice-group\"}))
  ```"
  (assert-compile (or (str? name) (sym? name)) "expected string or symbol for name" name)
  (assert-compile (all? #(and (list? $) (or (= 'clear! (first $))
                                            (= 'autocmd! (first $)))) [...]) "expected autocmd exprs for body" ...)
  (expand-exprs
    (let [name (->str name)]
      (icollect [_ expr (ipairs [...])
                 :into [`(vim.api.nvim_create_augroup ,name {:clear false})]]
        (if (= 'autocmd! (first expr))
          (let [[_ event pattern command ?options] expr
                options (or ?options {})
                options (doto options (tset :group name))]
            `(autocmd! ,event ,pattern ,command ,options))
          (let [[_ ?options] expr]
            `(clear! ,name ,?options)))))))

(λ clear! [name ?options]
  "Clears an augroup using the nvim_clear_autocmds API.

  Example of use:
  ```fennel
  (clear! some-group)
  ```
  That compiles to:
  ```fennel
  (vim.api.nvim_clear_autocmds {:group \"some-group\"})
  ```"
  (assert-compile (or (str? name) (sym? name)) "expected string or symbol for name" name)
  (assert-compile (or (nil? ?options) (tbl? ?options)) "expected table for options" ?options)
  (let [name (->str name)
        options (or ?options {})
        options (doto options (tset :group name))]
    `(vim.api.nvim_clear_autocmds ,options)))

(λ rock [identifier ?options]
  "Return a mixed table with the identifier as the first sequential element and
  options as hash-table items.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (if (not (nil? ?options)) (assert-compile (tbl? ?options) "expected table for options" ?options))
  (let [options (or ?options {})]
    (doto options (tset 1 identifier))))




(λ packadd! [package]
  "Loads a package using the vim.api.nvim_cmd API.
  Accepts the following arguements:
  package -> a symbol.
  Example of use:
  ```fennel
  (packadd! packer.nvim)
  ```"
  (assert-compile (sym? package) "expected symbol for package" package)
  (let [package (->str package)]
    `(vim.api.nvim_cmd {:cmd :packadd :args [,package]} {})))

(λ map! [[modes] lhs rhs ?options]
  "Add a new mapping using the vim.keymap.set API.

  Accepts the following arguments:
  modes -> is a sequence containing a symbol, each character of the symbol is
           a mode.
  options -> a table of options. Optional. If the :desc option is not specified
             it will be inferred.

  Example of use:
  ```fennel
  (map! [nv] \"<leader>lr\" vim.lsp.references
        {:silent true :buffer 0 :desc \"This is a description\"})
  ```
  That compiles to:
  ```fennel
  (vim.keymap.set [:n :v] \"<leader>lr\" vim.lsp.references
                  {:silent true
                   :buffer 0
                   :desc \"This is a description\"})
  ```"
  (let [modes (icollect [char (string.gmatch (->str modes) ".")] char)
        options (or ?options {})
        options (if (nil? options.desc)
                  (doto options (tset :desc (if (quoted? rhs) (quoted->str rhs)
                                              (str? rhs) rhs
                                              (view rhs))))
                  options)
        rhs (if (quoted? rhs) (quoted->fn rhs) rhs)]
    `(vim.keymap.set ,modes ,lhs ,rhs ,options)))

(λ buf-map! [[modes] lhs rhs ?options]
  "Add a new mapping using the vim.keymap.set API.
  Sets by default the buffer option.

  Accepts the following arguments:
  modes -> is a sequence containing a symbol, each character of the symbol is
           a mode.
  lhs -> must be an string.
  rhs -> can be an string, a symbol, a function or a quoted expression.
  options -> a table of options. Optional. If the :desc option is not specified
             it will be inferred.

  Example of use:
  ```fennel
  (map! [nv] \"<leader>lr\" vim.lsp.references
        {:silent true :desc \"This is a description\"})
  ```
  That compiles to:
  ```fennel
  (vim.keymap.set [:n :v] \"<leader>lr\" vim.lsp.references
                  {:silent true
                   :buffer 0
                   :desc \"This is a description\"})
  ```"
  (assert-compile (sym? modes) "expected symbol for modes" modes)
  (assert-compile (str? lhs) "expected string for lhs" lhs)
  (assert-compile (or (str? rhs) (sym? rhs) (fn? rhs) (quoted? rhs)) "expected string, symbol, function or quoted expression for rhs" rhs)
  (assert-compile (or (nil? ?options) (tbl? ?options)) "expected table for options" ?options)
  (let [options (or ?options {})
        options (doto options (tset :buffer 0))]
    (map! [modes] lhs rhs options)))

(λ let-with-scope! [[scope] name value]
  (assert-compile (or (str? scope) (sym? scope)) "expected string or symbol for scope" scope)
  (assert-compile (or (= :b (->str scope))
                      (= :w (->str scope))
                      (= :t (->str scope))
                      (= :g (->str scope))) "expected scope to be either b, w, t or g" scope)
  (assert-compile (or (str? name) (sym? name)) "expected string or symbol for name" name)
  (let [name (->str name)
        scope (->str scope)]
    `(tset ,(match scope
              :b 'vim.b
              :w 'vim.w
              :t 'vim.t
              :g 'vim.g) ,name ,value)))

(λ let-global! [name value]
  (assert-compile (or (str? name) (sym? name)) "expected string or symbol for name" name)
  (let [name (->str name)]
    `(tset vim.g ,name ,value)))

(λ let! [...]
  "Set a vim variable using the vim.<scope>.name API.
  Accepts the following arguments:
  [scope] -> optional. Can be either [g], [w], [t] or [b]. It's either a symbol
             or a string surrounded by square brackets.
  name -> either a symbol or a string.
  value -> anything.
  Example of use:
  ```fennel
  (let! hello :world)
  (let! [w] hello :world)
  ```
  That compiles to:
  ```fennel
  (tset vim.g :hello :world)
  (tset vim.w :hello :world)
  ```"
   (match [...]
     [[scope] name value] (let-with-scope! [scope] name value)
     [name value] (let-global! name value)
     _ (error "expected let! to have at least two arguments: name value")))

(λ echo! [msg]
  "Print a vim message without any format."
  (assert-compile (str? msg) "expected string for msg" msg)
  `(vim.notify ,msg vim.log.levels.INFO))

(λ warn! [msg]
  "Print a vim message with a warning format."
  (assert-compile (str? msg) "expected string for msg" msg)
  `(vim.notify ,msg vim.log.levels.WARN))

(λ err! [msg]
  "Print a vim message with an error format."
  (assert-compile (str? msg) "expected string for msg" msg)
  `(vim.notify ,msg vim.log.levels.ERROR))


{: contains?
 : ->str
 : expr->str
 : vlua
 : colorscheme
 : custom-set-face!
 : set!
 : local-set!
 : command!
 : local-command!
 : autocmd!
 : augroup!
 : clear!
 : rock
 : map!
 : buf-map!
 : let!
 : echo!
 : warn!
 : err!}

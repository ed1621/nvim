(require-macros :hibiscus.vim)
(require-macros :hibiscus.packer)
(local utils (require :core.utils))

(packer-setup)

(packer
    ;; fennel
  (use! :Olical/conjure)
  (use! :udayvir-singh/hibiscus.nvim)
  (use! :gpanders/nvim-parinfer)

  (use! :nathom/filetype.nvim
        :config #(let [ft (require :filetype)] (ft.setup {})))
  (use! :nvim-lua/plenary.nvim)
  (use! :nvim-neo-tree/neo-tree.nvim
     :branch :v2.x
     :requires [:nvim-lua/plenary.nvim :kyazdani42/nvim-web-devicons :MunifTanjim/nui.nvim]
     :config #(require :plugins.configurations.neotree))
  (use! :romgrk/barbar.nvim
        :requires [:kyazdani42/nvim-web-devicons]
        :setup #(require :core.mappings.barbar))
  (use! :Pocco81/AutoSave.nvim
        :config #(let [autosave (require :autosave)] (autosave.setup {})))
  (use! :kana/vim-textobj-entire
        :requires :kana/vim-textobj-user)
  (use! :j-hui/fidget.nvim
        :config #(let [fidget (require :fidget)] (fidget.setup {})))
  (use! :max397574/better-escape.nvim
        :config #(let [better-escape (require :better_escape)] (better-escape.setup {})))
  (use! :pwntester/octo.nvim
        :requires [:nvim-lua/plenary.nvim :nvim-telescope/telescope.nvim :kyazdani42/nvim-web-devicons]
        :config #(let [octo (require :octo)] (octo.setup {})))
  ; (use! :folke/which-key.nvim
  ;       :config #(require :plugins.configurations.whichkey))
  ; (use! :ThePrimeagen/harpoon
  ;       :setup #(require :core.mappings.harpoon))
  ;; telescope
  (use! :nvim-telescope/telescope.nvim
        :requires [:nvim-lua/plenary.nvim :nvim-telescope/telescope-fzy-native.nvim]
        :config #(require :plugins.configurations.telescope)
        :setup #(require :core.mappings.telescope))
  ;; tpope
  (use! :tpope/vim-abolish)
  (use! :tpope/vim-surround)
  (use! :tpope/vim-commentary)
  (use! :tpope/vim-repeat)
  (use! :tpope/vim-eunuch)
  ;; nvim cmp
  ; (use! :L3MON4D3/LuaSnip 
  ;         :event :InsertEnter
  ;         :config #(require :plugins.configurations.luasnip)
  ;         :requires [:rafamadriz/friendly-snippets])
  ; (use! :hrsh7th/nvim-cmp
  ;       :config #(require :plugins.configurations.cmp)
  ;       :requires [:hrsh7th/cmp-path
  ;                  :hrsh7th/cmp-buffer
  ;                  :hrsh7th/cmp-nvim-lsp
  ;                  :PaterJason/cmp-conjure
  ;                  :saadparwaiz1/cmp_luasnip
  ;                  :lukas-reineke/cmp-under-comparator
  ;                  :L3MON4D3/LuaSnip])
  ; (use! :saadparwaiz1/cmp_luasnip
  ;       :after :LuaSnip)
  ; (use! :lukas-reineke/cmp-under-comparator 
  ;         :module :cmp-under-comparator)
  ; (use! :windwp/nvim-autopairs
  ;       :config #(let [autopairs (require :nvim-autopairs)] (autopairs.setup {})))
  ;; lsp related
  (use! :nvim-treesitter/nvim-treesitter 
     :run ":TSUpdate"
     :config #(require :plugins.configurations.treesitter))
  (use! :neovim/nvim-lspconfig
        :opt true
        :wants [:nvim-lsp-installer :cmp-nvim-lsp :null-ls.nvim]
        ; :setup #(utils.lazy-load :nvim-lspconfig)
        :config #(require :plugins.configurations.lspconfig))
  (use! :williamboman/nvim-lsp-installer
        :requires [:neovim/nvim-lspconfig])
  (use! :jose-elias-alvarez/null-ls.nvim
        :config #(require :plugins.configurations.null-ls))
  ; (use! :andymass/vim-matchup
  ;       :opt true
  ;       :setup #(utils.lazy-load :vim-matchup))
  ; (use! :mfussenegger/nvim-dap
  ;       :config #(require :plugins.configurations.dap)
  ;       :setup #(require :core.mappings.dap))
  ; (use! :tami5/lspsaga.nvim
  ;       :config #(require :plugins.configurations.lspsaga)
  ;       :setup #(require :core.mappings.lspsaga))
  ;; specific code plugins
    ;; scala
  (use! :scalameta/nvim-metals
        :requires [:nvim-lua/plenary.nvim]
        :config #(require :plugins.configurations.scalametals))
        ; :setup #(require :core.mappings.metals))
    ;; hocon
  (use! :satabin/hocon-vim
        :ft [:conf])
  ;; ui
  (use! :glepnir/zephyr-nvim
     :requires [:nvim-treesitter/nvim-treesitter])
  (use! :sam4llis/nvim-tundra)
  (use! :katawful/kat.nvim
      :tag "1.0")
  (use! :kyazdani42/nvim-web-devicons)
  (use! :mechatroner/rainbow_csv 
        :ft [:csv :tsv])
  (use! :vimlab/split-term.vim
        :setup #(require :core.mappings.split-term)))
  ; (use! :lewis6991/gitsigns.nvim
  ;       :config #(require :plugins.configurations.gitsigns)
  ;       :setup #(utils.lazy-load :gitsigns.nvim))
  ; (use! :famiu/feline.nvim
  ;       :config #(require :plugins.configurations.feline))
  ; (use! :glepnir/dashboard-nvim
  ;       :config #(require :plugins.configurations.dashboard)
  ;       :setup #(require :core.mappings.dashboard))
  ; (use! :lukas-reineke/indent-blankline.nvim
  ;       :event :BufRead
  ;       :config #(require :plugins.configuration.blankline))


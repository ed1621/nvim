(require-macros :hibiscus.vim)
(require-macros :hibiscus.packer)

(packer-setup)

(packer
	(use! :udayvir-singh/hibiscus.nvim)
	(use! :nvim-treesitter/nvim-treesitter 
				:run ":TSUpdate"
        :config #(require :plugins.configurations.treesitter))
	(use! :glepnir/zephyr-nvim
				:requires ["nvim-treesitter/nvim-treesitter"])
	(use! :nvim-neo-tree/neo-tree.nvim
				:branch "v2.x"
				:requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"]
				:config #(require :plugins.configurations.neotree))
  (use! :romgrk/barbar.nvim
        :requires ["kyazdani42/nvim-web-devicons"]
        :setup #(require :core.mappings.barbar))
  (use! :Olical/conjure)
  (use! :nvim-telescope/telescope.nvim
        :requires ["nvim-lua/plenary.nvim" "nvim-telescope/telescope-fzy-native.nvim"]
        :config #(require :plugins.configurations.telescope)
        :setup #(require :core.mappings.telescope))
  ;; tpope
  (use! :tpope/vim-commentary)
  ;; lsp
  (use! :williamboman/nvim-lsp-installer)
  (use! :jose-elias-alvarez/null-ls.nvim
        :config #(require :plugins.configurations.null-ls))
)

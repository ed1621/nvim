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
)

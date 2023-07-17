local packer = require('core.utils.init').packer.bootstrap()
local use = packer.use

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 60
local height = 20

return packer.startup({
  function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      requires = { 
        {'nvim-lua/plenary.nvim' },
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
      },
      setup = function()
        require('core.mappings').telescope()
      end,
      config = function()
        require('plugins.config._telescope')
      end
    }
    use {
      'akinsho/bufferline.nvim',
      tag = 'v3.*',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('plugins.config.bufferline')
      end
    }
    use 'mechatroner/rainbow_csv'
    use { 'Pocco81/auto-save.nvim',
      config = function()
        require('auto-save').setup{}
      end
    }
    use { 'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      setup = function()
        require('core.mappings').nvimtree()
      end,
      config = function()
        require('plugins.config.nvimtree')
      end
    }
    use { 'katawful/kat.nvim',
      tag = '3.1'
    }
    use { 'nvim-treesitter/nvim-treesitter',
      run = function ()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require('plugins.config._treesitter').parsers()
        require('plugins.config._treesitter').config()
      end
    }
    use { 'williamboman/mason.nvim',
      config = function()
        require('mason').setup()
      end
    }
    use { 'williamboman/mason-lspconfig.nvim',
      after = {'mason.nvim'},
      config = function()
        require('plugins.config.lsp')
      end
    }
    use 'neovim/nvim-lspconfig'
    use {
      'someone-stole-my-name/yaml-companion.nvim',
      requires = {
        { 'neovim/nvim-lspconfig'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope.nvim'}
      },
      config = function()
        require('telescope').load_extension('yaml_schema')
      end,
    }
    use {
      "numToStr/FTerm.nvim",
      setup = function()
        require('core.mappings').fterm()
      end,
    }
    use {
      'kana/vim-textobj-entire',
      requires = {
        'kana/vim-textobj-user'
      }
    }
    -- t-pizzle inspired things
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    --other
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }
  end
})

local packer = require('core.utils.init').packer.bootstrap()
local use = packer.use

return packer.startup({function()
  use 'wbthomason/packer.nvim'
  use { 
    'nathom/filetype.nvim',
    config = function ()
      require('filetype').setup{}
    end
  }
  use 'rcarriga/nvim-notify'
  use 'nvim-lua/plenary.nvim'
  use {
    'ThePrimeagen/harpoon',
    setup = function ()
      require('core.mappings').harpoon()
    end,
    wants = 'nvim-lua/plenary.nvim'
  }
  use {
    'michaelb/sniprun',
    run = 'bash ./install.sh'
  }
  use {
    "luukvbaal/nnn.nvim",
    config = function() 
      require('plugins.config.nnn_config')
    end,
    setup = function ()
      require('core.mappings').nnn()
    end
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}, 
      {
        'nvim-telescope/telescope-media-files.nvim',
        setup = function()
            require('core.mappings').telescope_media()
        end
      },
    },
    config = function() 
        require('plugins.config.telescope_config') 
    end,
    setup = function() 
        require('core.mappings').telescope() 
    end
  }

  use {
    'mickael-menu/zk-nvim',
    config = function ()
      require("zk").setup({
        -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope" or "fzf"
        picker = "telescope",

        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end
  }
  
  
  use { 
    'Pocco81/AutoSave.nvim',
    config = function()
      require('autosave').setup()
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'ggandor/lightspeed.nvim'
  use 'mechatroner/rainbow_csv'
  use 'fladson/vim-kitty'
  use {
    'max397574/better-escape.nvim',
    config = function ()
       require('better_escape').setup() 
    end
  }
  use {
    'vimlab/split-term.vim',
    setup = function()
        require('core.mappings').split_term()
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    opt = true,
    config = function()
        require('plugins.config.gitsigns_config')
    end,
    setup = function()
      require('core.utils.packerUtils').packer_lazy_load 'gitsigns.nvim'
    end
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = [[sh -c 'cd app && yarn install']],
    setup = function() 
        require('core.mappings').markdown_preview() 
    end
  }
  use { 
    'famiu/feline.nvim',
    config = function()
        require('plugins.config.feline')
    end
  }
  use {
    'knubie/vim-kitty-navigator',
    run = [[sh -c 'cp ./*.py ~/.config/kitty/']]
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function ()
      require('octo').setup()
    end
  }

  -- tpope
  use 'tpope/vim-abolish'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-eunuch'

  -- -- -- lsp stuff
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('plugins.config.treesitter_config').parsers()
        require('plugins.config.treesitter_config').config()
    end,
    run = ':TSUpdate'
  }
  use {
    'williamboman/nvim-lsp-installer',
 }
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    setup = function()
      require('core.utils.packerUtils').packer_lazy_load 'nvim-lspconfig'
    end,
    config = function()
        require('plugins.config.lsp_config')
    end,
  }
  use {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
    config = function() 
        require('plugins.config.lsp_signature_config') 
    end
  }
  use {
    'andymass/vim-matchup',
    opt = true,
    setup = function()
      require('core.utils.packerUtils').packer_lazy_load 'vim-matchup'
    end
  }
use { 
    'mfussenegger/nvim-dap',
    config = function ()
      require('plugins.config.dap_config') 
    end,
    setup = function()
        require('core.mappings').dap()
    end
  }
  use 'Pocco81/DAPInstall.nvim'
  use {
    'scalameta/nvim-metals',
    after ='nvim-lspconfig',
    config = function()
        require('plugins.config.scalametals_config')
    end,
    setup = function ()
        require('core.mappings').metals()
    end
  }
  use {
    'tami5/lspsaga.nvim',
    config = function()
      require('plugins.config.lspsaga_config')
    end,
    setup = function()
        require('core.mappings').lspsaga()
    end
  }

  -- ui
  -- -- THEMES
  use 'rafamadriz/neon' --needs global option to set theme style
  use 'ray-x/aurora'
  use 'savq/melange'
 
  -- -- other
  use {
    'glepnir/dashboard-nvim',
    config = function() 
        require('plugins.config.dashboard_config') 
    end,
    setup = function() 
        require('core.mappings').dashboard() 
    end
  }
  use {
    "akinsho/bufferline.nvim",
    config = function() 
        require('plugins.config.bufferline_config') 
    end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function() 
        require('plugins.config.blankline_config') 
    end
  }
  use {
    'norcalli/nvim-colorizer.lua', --colors hex codes
    event = 'BufRead',
    config = function() 
        require('plugins.config.colorizer_config') 
    end
  }

  -- nvim cmp
  use {
    'rafamadriz/friendly-snippets', 
    event = 'InsertEnter'
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function() 
        require('plugins.config.cmp_config') 
    end
  }
  use {
    'L3MON4D3/LuaSnip',
    wants = 'friendly-snippets',
    after = 'nvim-cmp',
    config = function() 
        require('plugins.config.luasnip_config') 
    end
  }
  use {
    'saadparwaiz1/cmp_luasnip', 
    after = 'LuaSnip'
  }
  use {
    'hrsh7th/cmp-nvim-lua', 
    after = 'cmp_luasnip'
  }
  use {
    'hrsh7th/cmp-nvim-lsp', 
    after = 'cmp-nvim-lua'
  }
  use {
    'hrsh7th/cmp-buffer', 
    after = 'cmp-nvim-lsp'
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function() 
        require('plugins.config.autopairs_config') 
    end
  }
  use {
    'sbdchd/neoformat',
    cmd = 'Neoformat',
    setup = function() 
        require('core.mappings').neoformat() 
    end
  }

  use {
    'folke/which-key.nvim',
    config = function ()
      require('which-key').setup{}
    end
  }
  use {
    'kana/vim-textobj-entire', 
    requires = 'kana/vim-textobj-user'
  }
  use {
    'mpickering/hlint-refactor-vim', 
    ft = {'hl', 'lhs'}
  }
  use {
    'abecodes/tabout.nvim',
    config = function ()
      require('plugins.config.tabout_config')
    end,
    wants = {'nvim-treesitter'},
    after = {'nvim-cmp'}
  }
  use 'ndmitchell/ghcid'
  use { 
    'rcarriga/vim-ultest', 
    requires = 'vim-test/vim-test', 
    run = ':UpdateRemotePlugins' 
  }
  use 'norcalli/nvim_utils'

end})

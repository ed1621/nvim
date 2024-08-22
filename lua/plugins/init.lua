return {
    {
        'katawful/kat.nvim',
        tag = '3.1',
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kat.nvim]])
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
         },
        keys = function()
            require('core.mappings').telescope()
        end,
        config = function()
            require('plugins.config._telescope')
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('plugins.config.bufferline')
        end
    },
    { 'mechatroner/rainbow_csv' },
    {
        'Pocco81/auto-save.nvim',
        config = function()
            require('auto-save').setup()
        end
    },
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {'nvim-tree/nvim-web-devicons'},
      keys = function()
        require('core.mappings').nvimtree()
      end,
      config = function()
        require('plugins.config.nvimtree')
      end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('plugins.config._treesitter').config()
            require('plugins.config._treesitter').parsers()
        end
    },
    {
        'williamboman/mason.nvim',
        config = function ()
            require('mason').setup()
        end
    },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim'
        },
        config = function ()
            require('plugins.config.lsp')
        end
    },
    {
        'numToStr/Fterm.nvim',
        keys = function ()
            require('core.mappings').fterm()
        end
    },
    {
        'kana/vim-textobj-entire',
        dependencies = 'kana/vim-textobj-user'
    },
    { 'tpope/vim-abolish' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup()
        end
    },
    { 'numToStr/Comment.nvim' }
}

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
      'jemag/telescope-diff.nvim',
      dependencies = {
        { 'nvim-telescope/telescope.nvim' }
      }
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
            -- require('plugins.config._treesitter').parsers()
        end
    },
    {
        'mason-org/mason.nvim',
        version = '^1.0.0',
        config = function ()
            require('mason').setup()
        end
    },
    { 'neovim/nvim-lspconfig' },
    {
        'mason-org/mason-lspconfig.nvim',
        version = '^1.0.0',
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
    { 'numToStr/Comment.nvim' },
    {
      'benlubas/molten-nvim',
      version = "^1.0.0",
      build = ":UpdateRemotePlugins"
    },
    {
        'geg2102/nvim-jupyter-client',
        config = function()
            require('nvim-jupyter-client').setup({})
        end
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      config = function()
          local highlight = {
              "RainbowRed",
              "RainbowYellow",
              "RainbowBlue",
              "RainbowOrange",
              "RainbowGreen",
              "RainbowViolet",
              "RainbowCyan",
          }

          local hooks = require "ibl.hooks"
          -- create the highlight groups in the highlight setup hook, so they are reset
          -- every time the colorscheme changes
          hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
              vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
              vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
              vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
              vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
              vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
              vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
              vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
          end)
          require("ibl").setup { indent = { highlight = highlight } }
      end,
      opts = {},
    },
  -- {
  --   "petertriho/nvim-scrollbar",
  --   config = function ()
  --       require("scrollbar").setup()
  --   end
  -- }
}

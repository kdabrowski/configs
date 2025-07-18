local packer = require('packer')

packer.startup(function(use)
  -- Packer manages itself
  use { "wbthomason/packer.nvim" }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use { "ellisonleao/gruvbox.nvim" }
  use('nvim-lua/plenary.nvim')
  use('tpope/vim-fugitive')
  use('mbbill/undotree')
  use('mogulla3/rspec.nvim')
  use('ggandor/leap.nvim')
  use('nvimtools/none-ls.nvim')
  use('rafamadriz/friendly-snippets')
  use('windwp/nvim-ts-autotag')
  use('hrsh7th/cmp-nvim-lsp')

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets"
    }
  }

  use('jose-elias-alvarez/null-ls.nvim')
  use('williamboman/mason.nvim')
  use('neovim/nvim-lspconfig')
  use('williamboman/mason-lspconfig.nvim')

  use {
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      tag = "v2.*"
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
end)

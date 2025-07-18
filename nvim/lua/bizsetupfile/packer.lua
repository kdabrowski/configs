-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
  use{'hrsh7th/nvim-cmp',
    requires = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",       -- buffer completions
      "hrsh7th/cmp-path",         -- path completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "L3MON4D3/LuaSnip",         -- snippet engine
      "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    }
  }
  use('jose-elias-alvarez/null-ls.nvim')
  use('williamboman/mason.nvim')
  use('neovim/nvim-lspconfig')
  use('williamboman/mason-lspconfig.nvim')
  use({
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      tag = "v2.*"
    },
  })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  require("packer").startup(function()
    use({
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup()
      end,
    })
  end)
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
  }
end)

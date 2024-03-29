vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- AI
  use {
    'github/copilot.vim'
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- UI
  use 'scrooloose/nerdtree'
  use 'itchyny/lightline.vim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use 'gfontenot/vim-xcode'

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}
  }
  use {
    'prettier/vim-prettier', { 
      run = 'yarn install --frozen-lockfile --production',
        ft = {'javascript', 'typescript'} 
        }
  }

  -- Theme
  -- use { 
  --   'shaunsingh/nord.nvim', 
  --   commit = "78f5f001709b5b321a35dcdc44549ef93185e024", 
  --   -- See: https://github.com/shaunsingh/nord.nvim/issues/113
  -- }
  use 'rnmp/nord-vim'


  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Misc.
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'rbgrouleff/bclose.vim'
  use 'christoomey/vim-tmux-navigator'
end)

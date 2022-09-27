require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
-- gruvbox colour scheme use 'gruvbox-community/gruvbox'

    -- git integration
    use 'tpope/vim-fugitive'

    -- git status column
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'

    -- status bar
    use 'hoob3rt/lualine.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'ray-x/lsp_signature.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}

    use 'Chiel92/vim-autoformat'

    use 'simrat39/rust-tools.nvim'
end)


require('plugins_d/cmp')
require('plugins_d/lspconfig')
require('plugins_d/lualine')
require('plugins_d/treesitter')
require('plugins_d/etc')

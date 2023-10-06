local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'gruvbox-community/gruvbox'


    -- git integration
    use 'tpope/vim-fugitive'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
       requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'lewis6991/impatient.nvim'
    if packer_bootstrap then
        require('packer').sync()
    end
end)


require('plugins.lualine')
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.etc')

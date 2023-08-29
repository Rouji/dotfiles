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

    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'

    use 'L3MON4D3/LuaSnip'

    use 'simrat39/rust-tools.nvim'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/nvim-cmp'

    use 'ray-x/lsp_signature.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}

    use 'Chiel92/vim-autoformat'

    use({
      "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup()
        end,
        requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    })

    use 'lewis6991/impatient.nvim'
    if packer_bootstrap then
        require('packer').sync()
    end
end)


require('plugins.lualine')
require('plugins.lspconfig')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.etc')

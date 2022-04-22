set nocompatible              " be iMproved, required
filetype off                  " required

"source vim-plug
execute "source ".glob("~/.vim/plug.vim")

call plug#begin('~/.vim/vimplugs')

"gruvbox colour scheme
Plug 'gruvbox-community/gruvbox'

"git integration
Plug 'tpope/vim-fugitive'

"git status column
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

"status bar
Plug 'hoob3rt/lualine.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"autoformat code
Plug 'Chiel92/vim-autoformat'

"indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" openscad syntax
Plug 'sirtaj/vim-openscad'

call plug#end()


" disable fzf preview because it's very slow
let g:fzf_preview_window = ''

"display trailing whitespace
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

"persistent undo, swap files
set undofile
set swapfile

"buffers don't need to be saved
set hidden

"reduce redrawing to speed things up
set lazyredraw

"set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"case insensitive search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

"highlight current line
set cursorline

"search into subfolders
set path+=**

"show all matches at once
set wildmenu

"Start scrolling when we're 8 lines away from margins
set scrolloff=8

"open new splits to the right and below
set splitright

"set 80 column indicator
set colorcolumn=81,101

"set colour scheme
set t_Co=256
set background=dark
set termguicolors
colorscheme gruvbox

"remove background from vertical split line
highlight VertSplit ctermbg=NONE

"add relative line numbering
set relativenumber
set number

"enable mouse stuff
set mouse=a

"enable folding
set foldmethod=indent
set foldlevel=99

"file browsing
let g:netrw_banner=0
let g:netrw_liststyle=3

"split navigation with ctrl+{h,j,k,l}
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"swap ; and :
nnoremap ; :
nnoremap : ;

"fold using space
nnoremap <space> za

"close buffer without closing window with ctrl+c
nnoremap <C-c> :bp\|bd #<CR>

"ctrl-R in visual selection to replace in whole file
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" write using sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"enable powerline symbols
let g:airline_powerline_fonts = 1

"yaml settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" automatic spellcheck on text files
autocmd BufRead,BufNewFile *.md,*.txt,*.tex setlocal spell

"compe autocomplete stuff
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.spell = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

"inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" compe (shift-)tab to navigate completions
lua <<EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
EOF

" lsp config
lua <<EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
EOF

" lualine config
lua <<EOF
require('lualine').setup{
    options = {
        theme = 'gruvbox',
        extensions = {'fugitive'}
    }
}
EOF

"indentation guide config
lua <<EOF
vim.g.indent_blankline_char_list = {"|"}
vim.g.indent_blankline_show_first_indent_level = false
EOF

" run gitsigns
lua require('gitsigns').setup()

" include text editing stuff
if !empty(glob("~/.vim/txtfunc.vim"))
    source ~/.vim/txtfunc.vim
endif

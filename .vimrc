set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"git integration
Plugin 'tpope/vim-fugitive'
"git status column
Plugin 'airblade/vim-gitgutter'

"status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"code completion
Plugin 'Valloric/YouCompleteMe'

"python stuff
"Plugin 'davidhalter/jedi-vim'

"autoformat code
Plugin 'Chiel92/vim-autoformat'

"indentation guides
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"indentation guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

" ycm config
"let g:ycm_always_populate_location_list=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1

"snippets bindings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"airline config
set ttimeoutlen=50
set laststatus=2
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

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
colorscheme gruvbox

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

"make ; do the same as :
nnoremap ; :

"fold using space
nnoremap <space> za

"close buffer without closing window with ctrl+c
nnoremap <C-c> :bp\|bd #<CR>

"ctrl-R in visual selection to replace in whole file
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"enable powerline symbols
let g:airline_powerline_fonts = 1

"f9 to run stuff
autocmd FileType python nnoremap <F9> :!%:p<CR>

"f10 to make
map <F10> :w <Bar> if filereadable('Makefile') <Bar> silent make! &> /dev/null <Bar> endif <CR>

" automatic spellcheck on text files
autocmd BufRead,BufNewFile *.md,*.txt,*.tex setlocal spell

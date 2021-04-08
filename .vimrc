set nocompatible              " be iMproved, required
filetype off                  " required

"source vim-plug
execute "source ".glob("~/.vim/plug.vim")

call plug#begin('~/.vim/vimplugs')

"git integration
Plug 'tpope/vim-fugitive'
"git status column
Plug 'airblade/vim-gitgutter'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" language-server integration for completion etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"autoformat code
Plug 'Chiel92/vim-autoformat'

"indentation guides
Plug 'nathanaelkane/vim-indent-guides'

" sidebar for tags
Plug 'majutsushi/tagbar'

" better c++ highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" openscad syntax
Plug 'sirtaj/vim-openscad'

call plug#end()

"indentation guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

"snippets bindings
" let g:UltiSnipsExpandTrigger="<C-j>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" coc config
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <tab> and <s-tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"airline config
set ttimeoutlen=50
set laststatus=2
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" disable fzf preview because it's very slow
let g:fzf_preview_window = ''

" better c++ highlighting settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1

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

"make ; do the same as :
nnoremap ; :

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

"f9 to run stuff
autocmd FileType python nnoremap <F9> :!%:p<CR>

"yaml settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

"f10 to make
map <F10> :w <Bar> if filereadable('Makefile') <Bar> silent make! &> /dev/null <Bar> endif <CR>

" automatic spellcheck on text files
autocmd BufRead,BufNewFile *.md,*.txt,*.tex setlocal spell

" include text editing stuff
if !empty(glob("~/.vim/txtfunc.vim"))
    source ~/.vim/txtfunc.vim
endif

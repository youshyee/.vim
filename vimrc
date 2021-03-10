"
"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
" Author: xinyu

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
set clipboard=unnamedplus
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
syntax on
set number
set hidden          " Required to keep multiple buffers open multiple buffers
set pumheight=10    " Makes popup menu smaller
set cmdheight=2     " More space for displaying messages
set laststatus=2    " Always display the status line
set background=dark " tell vim what the background color looks like
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set autoindent
set list
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" automaticaly delects all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :

noremap ; :
" Save & quit
noremap Q :q<CR>
"noremap <C-q> :qa<CR>
noremap S :Autoformat<CR>:w<CR>
" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-q> :q<CR>

" Copy to system clipboard
" vnoremap Y "+y
" nnoremap P "+p
" Better indenting
vnoremap < <gv
vnoremap > >gv

" join lines
noremap <bar> :join!<CR>

" === Cursor Movement

" Move selected line / block of text in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" redo command
noremap U :redo<CR>

" Better window navigation
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-n> <C-\><C-n> " this line will lead to esc not function in fzf previewer

" " Press ` to change case (instead of ~)
noremap ` ~

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize +2<CR>
nnoremap <silent> <M-k>    :resize -2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" === Tab management
" ===
" Create a new tab with tu
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> 10gt

nnoremap zz <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,. <Esc>a<++><Esc>
inoremap ,. <++>
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'ajmwagar/vim-deus'
Plug 'crusoexia/vim-dracula'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'tomtom/tcomment_vim' " in <space>/ to comment a line or <space>; to comment inline
Plug 'godlygeek/tabular' " :Tabularize <regex> to align
Plug 'Chiel92/vim-autoformat' "format text by \f
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
call plug#end()
" ## set color
color dracula

nnoremap zz <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,. <Esc>a<++><Esc>
inoremap ,. <++>
" comment
"
" ===
" === tcomment_vim
" ===
let g:tcomment_maps = 0 " no preload comment
vmap z/ :TComment<CR>
noremap z/ :TComment<CR>
nmap z; :TCommentRight<CR>
" ===
" === floatterm
" ===

inoremap <expr> <esc> ("\<esc>")




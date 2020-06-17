"
" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|
"
" Author: xinyu

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.vim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.vim/default_configs/_machine_specific_default.vim ~/.vim/_machine_specific.vim"
endif
source ~/.vim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir

" set vim as default pager
" let $PAGER=''

" ===
" === Editor behavior
" ===
set number
set relativenumber

filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler
" a buffer become hiden when abadoned
set hid

set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set cmdheight=1
" don't redraw while executing macros
set lazyredraw

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" show match brackets whe text indicator is over them
set showmatch

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8

" use unix as the stardard file type
set ffs=unix,dos,mac
" Add a bit extra margin to the left
set foldcolumn=1

set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set showcmd
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set visualbell
silent !mkdir -p ~/.vim/tmp/backup
silent !mkdir -p ~/.vim/tmp/undo
"silent !mkdir -p ~/.vim/tmp/sessions
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.vim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=500
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" automaticaly delects all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
"noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>

" make Y to copy till the end of the line
"nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y
nnoremap P "+p

nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Folding
noremap <silent> <LEADER>o za

" join lines
noremap <bar> :join!<CR>
" Open up lazygit
noremap \gg :git
"noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" page down
noremap <C-w> <C-f>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k
" < h   l >
"     j
"     v
"noremap <silent> gu gk
"noremap <silent> ge gj

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j
" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" redo command
noremap U :redo<CR>

" ===

" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <Leader>sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap <Leader>sj :set splitbelow<CR>:split<CR>
noremap <Leader>sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap <Leader>sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap R<up> :res +10<CR>
noremap R<down> :res -10<CR>
noremap R<left> :vertical resize-10<CR>
noremap R<right> :vertical resize+10<CR>

" === Tab management
" ===
" Create a new tab with tu
noremap <Leader>tt :tabe<CR>
" Move around tabs with tn and ti
noremap <Leader>th :-tabnext<CR>
noremap <Leader>tl :+tabnext<CR>

execute "set <M-1>=\e1"
execute "set <M-2>=\e2"
execute "set <M-3>=\e3"
execute "set <M-4>=\e4"
execute "set <M-5>=\e5"
execute "set <M-6>=\e6"
execute "set <M-7>=\e7"
execute "set <M-8>=\e8"
execute "set <M-9>=\e9"
execute "set <M-0>=\e0"
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

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.vim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

"noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.vim/plugged')
Plug 'RRethy/vim-illuminate'
Plug 'pechorin/any-jump.vim' "jump to anything by gj
Plug 'airblade/vim-rooter' " change cwd to project dir
"
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'ajmwagar/vim-deus'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "c-f find in files c-l find in line

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'liuchengxu/vista.vim'

" Snippets
Plug 'SirVer/ultisnips' "  # to do
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree' " <leader>u toggle undotree
" Git
Plug 'tpope/vim-fugitive'
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>/ to comment a line or <space>; to comment inline
Plug 'theniceboy/antovim' "  'gs' to switch true to false
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
"Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " :Tabularize <regex> to align
"Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion' " toggle ' quick locate by letter
Plug 'svermeulen/vim-subversive' " use ss to replace line with place holder <++> use s<motion> to replace with <++>
" Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'  "use f + letter to locate quickly forward, F + letter backward
Plug 'terryma/vim-multiple-cursors'

" Formatter
Plug 'Chiel92/vim-autoformat' "format text by <space>\

" For general writing
Plug 'junegunn/goyo.vim' " toggle <leader>gy go to zenmode

Plug 'mhinz/vim-startify'

" Vim Applications

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

call plug#end()

" experimental
set lazyredraw
"set regexpengine=1


" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================


" ===
" === airline.vim
" ===
let g:airline_powerline_fonts = 1
" let g:airline_theme='simple'

" ==
" == GitGutter
" ==
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap \gf :GitGutterFold<CR>
nnoremap \h :GitGutterPreviewHunk<CR>
nnoremap \- :GitGutterPrevHunk<CR>
nnoremap \= :GitGutterNextHunk<CR>

" ===
" === vim-fugitive
" ===
nnoremap \gb :Gblame<CR>
nnoremap \gm :Git commit -av<CR>
nnoremap \gi :CocList gitignore

" ===
" === nerdtree
" ===
nnoremap tt :NERDTreeToggle<CR>
let g:NERDTreeMapOpenInTab = "l"
let g:NERDTreeMapOpenVSplit = "S"
" ===
" === anyjump
" ===
let g:any_jump_disable_default_keybindings=1
" Jump to definition under cursore
nnoremap gj :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap gj :AnyJumpVisual<CR>
" open previous opened file (after jump)
nnoremap gJ :AnyJumpBack<CR>
" open last closed search window again
nnoremap gR :AnyJumpLastResults<CR>
" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
set rtp+=/usr/bin/fzf
noremap <C-p> :Files<CR>
noremap <C-f> :Rg<CR>
noremap <C-h> :History<CR>
noremap <C-l> :Lines<CR>
noremap <C-s> :Snippets<CR>
" let g:fzf_preview_window = 'right:60%'
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }


" ===
" === CTRLP (Dependency for omnisharp)
" ===
"let g:ctrlp_map = ''
"let g:ctrlp_cmd = 'CtrlP'



" ===
" === Undotree
" ===
noremap <Leader>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<a-n>'
let g:multi_cursor_start_key = '<C-N>'
let g:multi_cursor_select_all_key = '<a-N>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'


" ===
" === Vista.vim
" ===
noremap <C-t> :silent! Vista finder coc<CR>
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" ===
" === fzf-gitignore
" ===
" noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="C-m>"
" let g:UltiSnipsListSnippets="<C-m>"
" let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="tabdo"
"let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/Ultisnips/', $HOME.'/.vim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END

" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map ' <Plug>(easymotion-bd-f)
nmap ' <Plug>(easymotion-bd-f)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === tabular
" ===
vmap ta :Tabularize /


" ===
" === vim-after-object
" ===
"autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow parentheses
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap \p :XTabInfo<CR>

" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 550
hi illuminatedWord cterm=undercurl gui=undercurl
let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_ftwhitelist = ['vim', 'sh', 'python']
let g:Illuminate_highlightUnderCursor = 0 " no highlight undercursor word


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']


" ===
" === AsyncRun
" ===
noremap \gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6


" ===
" === tcomment_vim
" ===
vmap <Leader>/ gc
nmap <Leader>/ gcc
nmap <Leader>; g>$

" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.vim/_machine_specific.vim"
endif


### Insert

```vim
i
I
o
O
a
A
```

### HJKL movements

```vim
k
j
h
l
```

```vim
noremap K 5k
noremap H 0
noremap J 5j
noremap L $
```

### Save, Quit, Reload Vimrc

```vim
map S :w<CR>
map Q :q<CR>
map ; :
```

### Editor setup

```vim
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
```

```vim
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
```

### Basic operations

```vim
g - gg, G, #G
f
d
y
p
c
u
U--> <C-r>
```

Practice:
```
This is vim: the best editor out there.
Today is a "good day," said my friend.
```

### Searching

```vim
set hlsearch
exec "nohlsearch"
set incsearch
set ignoresearch
set smartcase
```

```vim
noremap = nzz
noremap - Nzz
```

```vim
map <LEADER><CR> :nohlsearch<CR>
```

### Macros

`qa` -> some operations -> `@a` (100@a)

### Basic Plugins (Pretty Dress)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```vim
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

call plug#end()
```

```vim
" Pretty Dress
colorscheme snazzy
let g:SnazzyTransparent = 1
set background=dark
let g:airline_theme='dracula'
```

### Visual Mode

### Visual Block Mode

### Split Screen

```vim
noremap s <nop>
```

```vim
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
```

```vim
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
```

```vim
" remap arrow keys to resizing splits
map R<up> :res +5<CR>
map R<down> :res -5<CR>
map R<left> :vertical resize-5<CR>
map R<right> :vertical resize+5<CR>
```


```

### Tabs


```vim
map tj :-tabnext<CR>
map tk :+tabnext<CR>
```


### Some setup for Plugins and some extra setup

```vim
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set wrap
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
```

### ale

`Plug 'w0rp/ale'`

```vim 
" ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']
```

`sudo pip3 install pylint autopep8 yapf`

### 


### Other useful stuff

```vim
" Quick compile key
map r :call CompileRun()
func! CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time sudo python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "Vimwiki2HTMLBrowse"
  endif
endfunc
```

```vim
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i
```

```vim
" cap/uncap letters
map ` ~
```

```vim
map <LEADER>sc :set spell!<CR>
```


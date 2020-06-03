# .vim

## After Installation, You Need To:


## After Installation, You Might Want To:

### On MacOS:

- [ ] Install MacVim and use Iterm2 if something is not working right

### For Error Checking
- [ ] See `_machine_specific.vim`

### For Code AutoComplete (YouCompleteMe)

- [ ] Install `cmake`
- [ ] Run `sudo python3 [your vim folder]/plugged/install.py`
- [ ] For python: `sudo pip3 install pylint autopep8 yapf`

### For Taglist:

- [ ] Install `ctags` for function/class/variable list


## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics

**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:w`

**_IMPORTANT_**

  Since the `i` key has been mapped to `k`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Cursor Movement

                                                           | Command      | What it does                                                | Equivalent (QWERTY)   |
                                                           | ------------ | ----------------------------------------------------------- | --------------------- |
                                                           | `u`          | cursor up a terminal line                                   | `k`                   |
                                                           | `e`          | cursor down a terminal line                                 | `j`                   |
                                                           | `n`          | cursor left                                                 | `h`                   |
                                                           | `i`          | cursor right                                                | `l`                   |
                                                           | `U`          | cursor up 5 terminal lines                                  | `5k`                  |
                                                           | `E`          | cursor down 5 terminal lines                                | `5j`                  |
                                                           | `N`          | cursor to the start of the line                             | `0`                   |
                                                           | `I`          | cursor to the end of the line                               | `$`                   |
                                                           | `Ctrl` `u`   | move the view port up 5 lines without moving the cursor     | `Ctrl` `y`            |
                                                           | `Ctrl` `e`   | move the view port down 5 lines without moving the cursor   | `Ctrl` `e`            |
                                                           | `w`          | next word                                                   |                       |
                                                           | `h`          | move to the end of this word                                | `e`                   |
                                                           | `b`          | previous word                                               |                       |

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



### 6 Bookmarks (vim-signiture)

| Action                          | Shortcut    | Command |
|---------------------------------|-------------|---------|
| Add/remove mark at current line | `m<letter>` |         |
| List all marks                  | `m/`        |         |
| Jump to the next mark in buffer | `m<SPACE>`  |         |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

### 7 Markdown File Editing

#### 7.1 Edit Table with `vim-table-mode`

Toggle "Table Editing Mode" with `<SPACE>tm` (equals to command `:TableModeToggle<CR>`)

### Some Other Useful Stuff

#### Press `<SPACE>fd` to highlight adjacent duplicated words

#### Press `tx` and enter your text

`tx Hello<Enter>`
```
 _   _      _ _       
| | | | ___| | | ___  
| |_| |/ _ \ | |/ _ \ 
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/ 
```


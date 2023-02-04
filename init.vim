" init.vim
" NeoVim configuration by Austin Keeley (@austinkeeley)
" Note: Run the command :source % to reload this configuration while editing
" it. You can also run :InitReload while editing any file to reload the
" configuration.

" Plugins are managed by vim-plug
" Install using
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" Then call :PlugInstall to install the plugins

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'TaDaa/vimade'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" -----------------------------------------------------------------------------
" Settings
" -----------------------------------------------------------------------------

" Many of these settings are implicitly set by NeoVim, but are explictly set
" here for Vim compatability.  See full list here: https://neovim.io/doc/user/vim_diff.html

" Standard usability (default in NeoVim)
set nocompatible
set backspace=indent,eol,start
set autoindent
set belloff=all
set hlsearch
set incsearch
set syntax

" Let the OS handle the mouse
set mouse=

" Sometimes I am in the fish shell, which is not POSIX compliant
set shell=/bin/bash

" Turn on numbers
set number

" Filetype awareness (default in NeoVim)
filetype on

" Change the terminal title to the filename
set title

" Show tabs and trailing whitespaces
"set listchars=trail:·,tab:»·
"set list

" Don't let Vim insert new line breaks
set textwidth=0

set wildmenu
set wildmode=longest:full,full

" Setting the update time to a lower value than the default (4 seconds) will
" make the gitgutter plugin more interactive
set updatetime=100

" Colors.
" These need to be installed from the vim-colorschemes plugin
" color molokai
set termguicolors
set background=dark
" Ayu has an extra option
"let ayucolor="dark"
colorscheme gruvbox

" Team spaces
set expandtab      " Insert spaces when I hit the tab key
set tabstop=4      " Insert 4 spaces
set shiftwidth=0   " Indent to tabstop

" Golang prefers tabs
autocmd FileType go setlocal noexpandtab

" The 80 column character limit is kind of outdated, but it's good to aim for.
" The current Rust style guide recommends 100.
set colorcolumn=80
" Note that Vim lets you set two color columns:
"set colorcolumn=80,100


" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'badwolf'

" -----------------------------------------------------------------------------
" Arrow key remapping
" -----------------------------------------------------------------------------

" Turn off arrow keys. This makes you much better at Vim hjkl movement.
" General modes non-recursive map.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" Insert mode non-recursive map
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" One alternative is to use the arrow keys to move between window splits.
" This is good for when you are using a full size keyboard with arrow keys
" and still want to put them to good use.
noremap <up> <C-w>k
noremap <down> <C-w>j
noremap <left> <C-w>h
noremap <right> <C-w>l

" -----------------------------------------------------------------------------
" NERDTree settings and mappings
" -----------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" -----------------------------------------------------------------------------
" Functions
" -----------------------------------------------------------------------------

" Remove trailing whitespaces
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" -----------------------------------------------------------------------------
" Commands, remaps, etc.
" -----------------------------------------------------------------------------

" Reloads the current init.vim file
command! InitReload source $MYVIMRC

command! InitOpen edit $MYVIMRC

" Shortcut for call StripTrailingWhitespaces()
command Trim call StripTrailingWhitespaces()

" Quickly toggle between tabs and spaces
nnoremap <leader>T :set noexpandtab<CR>
nnoremap <leader>t :set expandtab<CR

" Remap page-up and page-down to switch between tabs
nnoremap <PageUp> :tabprevious<CR>
nnoremap <PageDown> :tabnext<CR>

nnoremap <Tab> :bnext<CR>

" -----------------------------------------------------------------------------
"  LSP
"  The NeoVim specific stuff for the LSP is in Lua.
" -----------------------------------------------------------------------------
lua require'lspconfig'.rust_analyzer.setup({})
lua require'lspconfig'.clangd.setup({})


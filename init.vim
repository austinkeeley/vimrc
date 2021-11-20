" Vim configuration for Austin Keeley (@austinkeeley)
"
" Installation instructions (nvim)
" 1. Install Vundle
"     git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
" 2. Copy this file to ~/.config/nvim/init.vim
" 3. Start nvim
" 4. Run :PluginInstall

set nocompatible

"-------------------------------------------------------------------------------
" Vundle set up
"-------------------------------------------------------------------------------
" Set the runtime path to include Vundle and initialize
" For the regular Vim version, use:
" set runtimepath+=~/.vim/bundle/Vundle.vim
filetype off
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
"  Airline settings
"-------------------------------------------------------------------------------
" Make sure airline appears. 2 means "always"
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"-------------------------------------------------------------------------------
" NERDTree settings
"-------------------------------------------------------------------------------
" Ignore common extensions
let NERDTreeIgnore = ['\.o$', '\.pyc$']

"-------------------------------------------------------------------------------
" Syntastic settings
"-------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {'mode':'passive'}

"-------------------------------------------------------------------------------
" Usability, spaces, etc.
"-------------------------------------------------------------------------------
" Set sane backspace behavior. Modern Vim and Neovim already have this.
set backspace=indent,eol,start

set incsearch            " Turn on incremental search
set ignorecase smartcase " Ignore case when searching *unless* you search with a capital letter
set nowrap


" Turn off backups. Modern Vim and Neovim already have this.
set nobackup

" Team spaces
set expandtab     " Use spaces
set tabstop=4     " Tab key produces 4 spaces
set shiftwidth=0  " When using code with indents, indent to the tabstop

" Go prefers tabs
autocmd FileType go setlocal noexpandtab

" Use 2 space indents for Ruby and JS
autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2

" Show tabs and spaces
set listchars=tab:>-,trail:·
set list

" Don't let vim insert new lines
set textwidth=0

"-------------------------------------------------------------------------------
" Colors and Interface settings
"-------------------------------------------------------------------------------
" Turn on syntax highlighting
syntax on

" This sometimes works to make colors better
set termguicolors

" Set my colors; here's a few that I like
set background=dark
" color inkpot
" color solarized
" color railscasts
" color desertEX
" color zenburn
color molokai
" color dracula
" color slate
" color matrix
" color vibrantchalk
" color wombat256
" color zmrok
" color dante
" color freya

" Personal preferences to let me know where the cursor is
" set cursorline    " Note that this doesn't play nice with all color schemes.
" Defaulting to off
set number          " Show line numbers
set ruler           " Show the ruler at the bottom, although airline takes care of this
set colorcolumn=88  " Put a column 80 + 10 percent

" Does anyone actually use this?
set novisualbell

" Change the terminal title to be the title of whatever I'm editing
set title

"-------------------------------------------------------------------------------
" Get good
"-------------------------------------------------------------------------------
" Turn off the arrow keys to make you better at hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"-------------------------------------------------------------------------------
" Functions
"-------------------------------------------------------------------------------
" Remove trailing whitespace
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
command StripTrailingWhitespaces call StripTrailingWhitespaces()

" Automatically clean up trailing whitespace in source code. Note that if you're dealing
" with 'other people's code' you might make them angry when you commit a ton of changes
" due to this.
" See also the shortcut for showing trailing whitespace.
" autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

"-------------------------------------------------------------------------------
" Normal mode shortcuts
"-------------------------------------------------------------------------------
" Make it easier to resize window panes
nnoremap <silent> + :resize +1<CR>
nnoremap <silent> - :resize -1<CR>
nnoremap <silent> { :vertical resize -1<CR>
nnoremap <silent> } :vertical resize +1<CR>

" The default H, L, and M (capitals) jump the cursor around the screen and that's not
" very  useful. K opens a man page by default but I rarely want to read a man page in vim.
" Remap these to moving between window splits.
nnoremap <silent> H <C-w>h
nnoremap <silent> J <C-w>j
nnoremap <silent> L <C-w>l
nnoremap <silent> K <C-w>k

" Switch between Vim tabs with Ctrl-h and Ctrl-l
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" A shortcut for cleaning up JSON files
nnoremap <leader>j :%!python -m json.tool<CR>

" NERDTree toggle
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Capital L to do a syntastic check e.g. 'Lint'
" Lower case l to turn off syntastic
nnoremap <leader>L :SyntasticCheck<CR> :Errors<CR>
nnoremap <Leader>l :SyntasticReset<CR>

" Show trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
map <leader>w :match ExtraWhitespace /\s\+$/<CR>

" Quickly switch between tabs and spaces
map <leader>T :set noexpandtab<CR>
map <leader>t :set expandtab<CR>


" Install plugin system (not necessary if already setup)
if empty(glob('~/.vim/autoload/plug.vim'))
       silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'} " autocomplete
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " git support
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
call plug#end()

set updatetime=250 " how long (ms) after you stop typing vim refreshes things, used by vim-gitgutter and other plugins

" open doc files in vim
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" toggle nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
" default nerdtree v and > arrows
let g:NERDTreeDirArrowExpandable = '🙂'
let g:NERDTreeDirArrowCollapsible = '😮'
" open nerdtree when vim is started in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" show hidden files in nerdtree
let NERDTreeShowHidden=1
" F2 to get people who modified file
map <F2> :!git shortlog -s -n %<cr>

" Tab options
let g:myTabSize = 4 " Set myTabSize var to use below
let &shiftwidth = myTabSize " Tell vim how many columns is a tab
let &softtabstop = myTabSize " Tab and delete this many columns
let &tabstop = myTabSize " Actual hard tabstops will be my tab size
set expandtab " Make tabs be spaces
set autoread " Always reload a file when it has changed instead of asking -- only works on gvim
set autoindent
set number " Line numbers
set mouse=a " Allow mouse scrolling, other mouse events
" `sudo apt-get install vim-gtk` for clipboard to work on Ubuntu
set clipboard=unnamed,unnamedplus " Always yank to and from the system clipboard
set ignorecase
set smartcase " Smartcase in search
" set cursorline " Show current line highlighted
set incsearch " show search matches as you type
set termguicolors "use native true colors (only supported starting vim v8)
set nowrap " don't wrap text
set backspace=2 " Backspace works as normal -- actually moves cursor back and deletes
set tags=tags; " Tell vim to look for tags recursively downwards
set nostartofline " Keeps the cursor in its last spot when changing buffers (prevents it from going to start of line)

""""""""""" View options
set linespace=3 " Line space
syntax on
set background=dark

" Options for morhetz/gruvbox
let g:gruvbox_bold=0
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" Go options
let g:go_fmt_command = "goimports" " run goimports on save

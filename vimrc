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
call plug#end()

" toggle nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
" default nerdtree v and > arrows
"let g:NERDTreeDirArrowExpandable = '🙂'
"let g:NERDTreeDirArrowCollapsible = '😮'
" open nerdtree when vim is started in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" show hidden files in nerdtree
let NERDTreeShowHidden=1


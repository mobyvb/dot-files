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
call plug#end()

map <C-n> :NERDTreeToggle<CR> " toggle nerdtree with ctrl+n
let g:NERDTreeDirArrowExpandable = '🙂'
let g:NERDTreeDirArrowCollapsible = '😮'
